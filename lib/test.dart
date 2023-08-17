import 'package:auto_size_text/auto_size_text.dart';
import 'package:dglk_flutter_dev_kit/simple_button/simple_button.dart';
import 'package:flutter/material.dart';

class Offer {
  final String period;
  final String price;
  final String billedPeriod;
  final String freePeriod;

  const Offer({
    required this.period,
    required this.price,
    required this.billedPeriod,
    required this.freePeriod,
  });
}

final offers = [
  const Offer(
    period: '1 Month',
    price: '\$3.99',
    billedPeriod: 'Billed monthly',
    freePeriod: '2 weeks',
  ),
  const Offer(
    period: '3 Months',
    price: '\$2.99 /mo',
    billedPeriod: 'Billed every\n 3 months',
    freePeriod: '2 weeks',
  ),
  const Offer(
    period: '1 year',
    price: '\$1.99 /mo',
    billedPeriod: 'Billed annually',
    freePeriod: '2 weeks',
  ),
];

class PointPart {
  final String text;
  final bool isImportant;

  PointPart(this.text, {this.isImportant = false});
}

final points = [
  [
    PointPart('Notifications', isImportant: true),
    PointPart(' about payments and guest check in/out'),
  ],
  [
    PointPart('Export', isImportant: true),
    PointPart(' your requests '),
    PointPart('to an Excel', isImportant: true),
    PointPart(' file'),
  ],
  [
    PointPart('Statistics', isImportant: true),
    PointPart(' and analytics of rental '),
    PointPart('income', isImportant: true),
    PointPart(' (soon)'),
  ],
  [
    PointPart('Support', isImportant: true),
    PointPart(' developers and new features'),
  ],
  [
    PointPart('Access', isImportant: true),
    PointPart(' all the planning features for '),
    PointPart('fixed price', isImportant: true),
  ],
];

class OfferPage extends StatefulWidget {
  const OfferPage({super.key});

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  bool shouldNotify = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _TitleView(),
            const SizedBox(height: 24),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  for (final point in points)
                    Expanded(
                      child: _PointView(
                        point: point,
                      ),
                    ),
                  const _SeeWhatsNextButton(),
                ],
              ),
            ),
            const Expanded(
              flex: 8,
              child: _OneOfThreeView(),
            ),
            _ButtonView(
              shouldNotify: shouldNotify,
              onChanged: (value) {
                shouldNotify = value;
                setState(() {});
              },
            ),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}

class _OneOfThreeView extends StatelessWidget {
  const _OneOfThreeView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 28,
        ),
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 172,
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
                        offset: const Offset(0, 4),
                        blurRadius: 12,
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: List.generate(
                      offers.length,
                      (index) => Expanded(
                        child: _OneOfThreeItem(
                          offers[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 280.0),
                      child: Container(
                        height: 32,
                        constraints: const BoxConstraints(maxWidth: 96),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                size: 17,
                                color: Theme.of(context).colorScheme.onTertiary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Save 50%',
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                      fontSize: 13,
                                      color: Theme.of(context).colorScheme.onTertiary,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Container(
                  width: (MediaQuery.of(context).size.width - 32) / 3 + 16,
                  constraints: const BoxConstraints(maxWidth: 158),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.5,
                    ),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 28,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Most Popular',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.onSecondary,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: _OneOfThreeItem(
                          offers[1],
                          isBig: true,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _OneOfThreeItem extends StatelessWidget {
  final Offer offer;
  final bool isBig;
  const _OneOfThreeItem(this.offer, {this.isBig = false});

  @override
  Widget build(BuildContext context) {
    final smallStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: isBig ? 15 : 14,
          color: Theme.of(context).colorScheme.primaryContainer,
          fontWeight: FontWeight.w500,
        );

    final largeStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: isBig ? 22 : 20,
          color: Theme.of(context).colorScheme.primaryContainer,
          fontWeight: FontWeight.w700,
        );

    return Column(
      children: [
        SizedBox(height: isBig ? 12 : 24),
        Text(
          offer.period,
          style: smallStyle,
        ),
        const Spacer(),
        Text(
          offer.price,
          style: largeStyle,
        ),
        const Spacer(),
        Text(
          offer.billedPeriod,
          style: smallStyle,
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: smallStyle,
            children: [
              TextSpan(text: offer.freePeriod),
              TextSpan(
                text: ' free',
                style: smallStyle.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12)
      ],
    );
  }
}

class _SeeWhatsNextButton extends StatelessWidget {
  const _SeeWhatsNextButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "See what's coming next",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 15,
                      ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PointView extends StatelessWidget {
  final List<PointPart> point;
  const _PointView({required this.point});

  @override
  Widget build(BuildContext context) {
    final pointStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 14.5,
          color: Theme.of(context).colorScheme.primaryContainer,
          fontWeight: FontWeight.w500,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 4,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: pointStyle,
                children: List.generate(
                  point.length,
                  (index) {
                    final part = point[index];
                    return TextSpan(
                      text: part.text,
                      style: pointStyle.copyWith(
                        fontWeight: part.isImportant ? FontWeight.w700 : null,
                        fontSize: part.isImportant ? (pointStyle.fontSize ?? 0) + 0.4 : null,
                      ),
                    );
                  },
                ),
              ),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}

class _ButtonView extends StatelessWidget {
  final bool shouldNotify;
  final void Function(bool value) onChanged;

  const _ButtonView({this.shouldNotify = true, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => onChanged(!shouldNotify),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(shouldNotify ? 1.0 : 0.1),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.check,
                      size: 19,
                      color: shouldNotify
                          ? Theme.of(context).colorScheme.onSecondary
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  'Get a reminder the day before the trial ends',
                  maxLines: 1,
                  style: (Theme.of(context).textTheme.labelLarge)?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SimpleButton(
                  title: 'Start Free Trial',
                  callback: () {},
                  textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              MaterialButton(
                onPressed: () {},
                child: Text(
                  'Restore Purchases',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
                        fontSize: 13,
                      ),
                ),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  'Terms & Conditions',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
                        fontSize: 13,
                      ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _TitleView extends StatelessWidget {
  const _TitleView();

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w800,
          fontSize: 24,
          color: Theme.of(context).colorScheme.onBackground,
        );

    return Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: AutoSizeText.rich(
                  TextSpan(
                    style: titleStyle,
                    children: [
                      const TextSpan(text: 'Try Rental Planner '),
                      TextSpan(
                        text: 'Pro\n',
                        style: titleStyle.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const TextSpan(text: 'For '),
                      TextSpan(
                        text: 'Free',
                        style: titleStyle.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CloseButton(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Cancel anytime. No commitments.',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 15,
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
