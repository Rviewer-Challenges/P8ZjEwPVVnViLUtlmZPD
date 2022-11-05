import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/core/widgets/success_icon.dart';
import 'package:buon_appetito/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:buon_appetito/features/home/presentation/widgets/detail_item/description_item.dart';
import 'package:buon_appetito/features/home/presentation/widgets/detail_item/halves_item_section.dart';
import 'package:buon_appetito/features/home/presentation/widgets/detail_item/image_preview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailItemBody extends StatefulWidget {
  final Item item;

  const DetailItemBody({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<DetailItemBody> createState() => _DetailItemBodyState();
}

class _DetailItemBodyState extends State<DetailItemBody> {
  ValueNotifier<bool> isExpanded = ValueNotifier(false);
  ValueNotifier<bool> isAdded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is AddItemToCartSuccess) {
          isAdded.value = true;
          Future.delayed(const Duration(seconds: 2), () {
            isAdded.value = false;
          });
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(minHeight: constraints.maxHeight * 0.3),
                        child: ImagePreviewItem(item: widget.item),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(32, 32, 32, 40),
                        margin: const EdgeInsets.only(top: 10),
                        constraints: BoxConstraints(minHeight: constraints.maxHeight * 0.7),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(48),
                            topRight: Radius.circular(48),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DescriptionItem(item: widget.item),
                            const SizedBox(height: 20),
                            HalvesItemSection(item: widget.item),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: isAdded,
              builder: (BuildContext context, bool value, Widget? child) {
                return value == true ? const Center(child: SuccessIcon()) : const SizedBox();
              },
            ),
          ],
        );
      },
    );
  }
}
