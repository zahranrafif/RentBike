import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rentbike/constants/app_style.dart';
import 'package:rentbike/provider/radio_provider.dart';
import 'package:rentbike/widget/date_time_widget.dart';
import 'package:rentbike/widget/radio_widget.dart';
import 'package:rentbike/widget/textfield_widget.dart';

class AddNewRentModel extends ConsumerWidget {
  const AddNewRentModel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: double.infinity,
              child: Text(
                'New Rent',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade200,
          ),
          const Gap(6),
          const Text(
            'Nama Penyewa',
            style: AppStyle.headingOne,
          ),
          const Gap(6),
          TextFieldWidget(maxLine: 1, hintText: 'Masukkan Nama Penyewa'),
          const Gap(12),
          const Text('Deskripsi', style: AppStyle.headingOne),
          const Gap(6),
          const TextFieldWidget(maxLine: 5, hintText: 'Masukkan Deskripsi'),
          const Gap(12),
          const Text('Kategori', style: AppStyle.headingOne),
          Row(
            children: [
              Expanded(
                child: RadioWidget(
                  categColor: Colors.green,
                  titleRadio: 'Pinjam',
                  valueInput: 1,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  categColor: Colors.blue.shade700,
                  titleRadio: 'Keliling',
                  valueInput: 2,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  categColor: Colors.amberAccent.shade700,
                  titleRadio: 'Foto',
                  valueInput: 3,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 3),
                ),
              ),
            ],
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                  titleText: 'Tanggal',
                  valueText: 'dd/mm/yy',
                  iconSection: CupertinoIcons.calendar),
              Gap(12),
              DateTimeWidget(
                titleText: 'Time',
                valueText: 'hh : mm',
                iconSection: CupertinoIcons.clock,
              ),
            ],
          ),

          // Button Section
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: Colors.blue.shade800,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
              ),
              const Gap(20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text('Save'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}