import 'package:flutter/material.dart';
import 'package:stridex_store/pages/information_product.dart';
import 'package:stridex_store/widgets/text_shimmer_wave.dart';

class MyIFMProduct extends StatelessWidget {
  const MyIFMProduct({
    super.key,
    required this.widget,
  });

  final InformationProduct widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //BRAND
          Text(
            widget.shoe.brand,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 10),
          //PRICE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextShimmerWavePage(
                text: widget.shoe.names,
              ),
              Text(
                '${widget.shoe.price} USD',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          const SizedBox(height: 20),

          //Share
          Container(
            width: 80,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Share ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // TEXT
          Row(
            children: [
              Icon(
                Icons.rocket_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text(
                '  Free delivery within city.',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.add_box,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text(
                "  Free product exchange within 03 days.",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.check_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text(
                "  100% genuine product.",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          //DETAIL
          const SizedBox(height: 20),
          Text('DETAIL :', style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 20),

          Text(
            '- Product Uses :  ${widget.shoe.details.uses}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 10),

          Text(
            '- Material :  ${widget.shoe.details.material}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 10),

          Text(
            '- Product Origin :  ${widget.shoe.details.producer}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 10),

          Text(
            "- Instructions for use and storage: Avoid soaking in water "
            " for too long - Avoid contact with materials that cause "
            "discoloration - Do not use detergents, avoid machine washing.",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
