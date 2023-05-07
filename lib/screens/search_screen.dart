import 'package:flutter/material.dart';
import 'package:github/components/all.dart';
import 'package:github/constants/typography.dart';
import 'package:github/mocks/repositories_mock.dart';
import 'package:github/screens/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final repositories = kRepositoriesMock;
  @override
  Widget build(BuildContext context) {
    final repository = repositories.first;

    var _repositoryItem = ListTile(
      leading: CustomAvatar(
        avatarUrl: repository.owner?.avatar,
      ),
      subtitle: CustomText(
        text: '${repository.owner?.login}',
        style: TypographyType.body,
      ),
      title: CustomText(
        text: '${repository.name}',
        style: TypographyType.body,
      ),
    );
    return Scaffold(
      appBar: CustomAppBar(
        bottom: CustomSearchBar(
          onChanged: (search) => debugPrint('search'),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText(
                text: 'Resultados',
                style: TypographyType.title,
              ),
              ListView.separated(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: repositories.length,
                itemBuilder: (context, index) {
                  var repository = repositories[index];

                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfileScreen(repository: repository)));
                    },
                    leading: CustomAvatar(
                      avatarUrl: repository.owner?.avatar,
                    ),
                    subtitle: CustomText(
                      text: '${repository.owner?.login}',
                      style: TypographyType.body,
                    ),
                    title: CustomText(
                      text: '${repository.name}',
                      style: TypographyType.body,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return CustomDivider();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
