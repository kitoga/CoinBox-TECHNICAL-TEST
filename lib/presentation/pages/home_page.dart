import 'package:converter/core/services/country_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import '../providers/exchange_rate_providers.dart';
import '../viewmodels/exchange_rate_viewmodel.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _amountFocusNode = FocusNode();

  // @override
  // void initState() {
  //   super.initState();
  //   _amountController.text = '1000.00';
  //   _testApiConnection(ref);
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     ref.read(exchangeRateViewModelProvider.notifier).getExchangeRates('SGD');
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _amountController.text = '1000.00';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Set the initial amount in ViewModel
      final viewModel = ref.read(exchangeRateViewModelProvider.notifier);
      viewModel.setAmountFromString('1000.00');

      // Load initial rates and convert
      viewModel.getExchangeRates('USD').then((_) {
        viewModel.convertCurrency();
      });
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _amountFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(exchangeRateViewModelProvider);
    final viewModel = ref.read(exchangeRateViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Text
              const Center(
                child: Text(
                  'Currency Converter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xff1F2261),
                  ),
                ),
              ),
              const Center(
                child: const Text(
                  'Check live rates, set rate alerts, receive\nnotifications and more.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff808080), fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Amount Card
                    _buildAmountCard(state, viewModel),
                    Image.asset("assets/images/Group 5.png"),
                    // Converted Amount Card
                    _buildConvertedAmountCard(state),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              _buildConversionInfo(state),
              const Spacer(),

              _buildSwapButton(viewModel, state),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountCard(
    ExchangeRateState state,
    ExchangeRateViewModel viewModel,
  ) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Amount',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                // Currency Flag and Code
                _buildCurrencyChip(state.fromCurrency, true, viewModel),
                const SizedBox(width: 32),
                // Amount Input
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffEFEFEF),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: _amountController,
                        focusNode: _amountFocusNode,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d{0,2}'),
                          ),
                        ],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            viewModel.setAmountFromString(value);
                            viewModel.convertCurrency();
                          } else {
                            viewModel.setAmount(0);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConvertedAmountCard(ExchangeRateState state) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Converted Amount',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                // Currency Flag and Code
                _buildCurrencyChip(
                  state.toCurrency,
                  false,
                  ref.read(exchangeRateViewModelProvider.notifier),
                ),
                const SizedBox(width: 32),
                // Converted Amount
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffEFEFEF),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          state.convertedAmount.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyChip(
    String currencyCode,
    bool isFrom,
    ExchangeRateViewModel viewModel,
  ) {
    final state = ref.watch(exchangeRateViewModelProvider);
    final country = isFrom ? state.fromCountry : state.toCountry;
    return GestureDetector(
      onTap: () => _showCurrencyPicker(context, isFrom, viewModel),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          //color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Currency Flag (you can add flag emojis or images later)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  country?.emoji ?? '🏳️',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              currencyCode,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, size: 16, color: Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildConversionInfo(ExchangeRateState state) {
    if (state.exchangeRates == null) {
      return const Text(
        'No rates loaded yet',
        style: TextStyle(color: Colors.red),
      );
    }

    if (state.exchangeRates!.conversionRates.isEmpty) {
      return const Text(
        'Empty conversion rates',
        style: TextStyle(color: Colors.red),
      );
    }

    final fromRate =
        state.exchangeRates!.conversionRates[state.fromCurrency] ?? 1.0;
    final toRate =
        state.exchangeRates!.conversionRates[state.toCurrency] ?? 1.0;

    final conversionRate = toRate / fromRate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Indicative Exchange Rate',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '1 ${state.fromCurrency} = ${conversionRate.toStringAsFixed(4)} ${state.toCurrency}',
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSwapButton(
    ExchangeRateViewModel viewModel,
    ExchangeRateState state,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          viewModel.swapCurrencies();
          viewModel.convertCurrency();
        },
        icon: const Icon(Icons.swap_vert, size: 20),
        label: const Text('Swap Currencies'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff1F2261),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void _showCurrencyPicker(
    BuildContext context,
    bool isFrom,
    ExchangeRateViewModel viewModel,
  ) {
    final state = ref.read(exchangeRateViewModelProvider);
    final currencies =
        state.exchangeRates?.conversionRates.keys.toList() ??
        ['USD', 'EUR', 'GBP', 'JPY', 'CAD'];

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Currency',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: currencies.length,
                  itemBuilder: (context, index) {
                    final currency = currencies[index];
                    final country = CountryService.getCountryByCode(
                      state.countries,
                      currency,
                    );

                    return ListTile(
                      leading: Text(
                        country?.emoji ?? '🏳️',
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(currency),
                      subtitle: Text(country?.name ?? 'Unknown Country'),
                      onTap: () {
                        Navigator.pop(context);
                        if (isFrom) {
                          viewModel.setFromCurrency(currency);
                          viewModel.getExchangeRates(currency);
                          viewModel.loadCountries();
                        } else {
                          viewModel.setToCurrency(currency);
                          viewModel.loadCountries();
                        }
                        viewModel.convertCurrency();
                        viewModel.loadCountries();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
