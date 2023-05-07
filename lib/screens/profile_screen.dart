import 'package:flutter/material.dart';
import 'package:github/components/all.dart';
import 'package:github/constants/typography.dart';
import 'package:github/mocks/repositories_mock.dart';
import 'package:github/models/repository.dart';

class ProfileScreen extends StatelessWidget {
  final Repository repository;
  ProfileScreen({super.key, required this.repository});
  final repositories = kRepositoriesMock;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Repositório',
        hasBackButton: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomAvatar(
              avatarUrl: repository.owner?.avatar,
              radius: 80,
            ),
            Container(
              child: Column(
                children: [
                  CustomText(
                    text: 'Repositório:',
                    style: TypographyType.label,
                  ),
                  CustomText(
                    text: '${repository.name}',
                    style: TypographyType.title,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  CustomText(
                    text: 'Usuário:',
                    style: TypographyType.label,
                  ),
                  CustomText(
                    text: '${repository.owner?.login}',
                    style: TypographyType.title,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomText(
                    text: 'Descrição:',
                    style: TypographyType.label,
                  ),
                  CustomText(
                    text: '${repository.description}',
                    textAlign: TextAlign.center,
                    style: TypographyType.body,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
