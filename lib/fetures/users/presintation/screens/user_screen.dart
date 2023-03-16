import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:practice43/fetures/users/presintation/logic/bloc/users_bloc.dart';
import 'package:practice43/fetures/users/presintation/widgets/location_info_card.dart';
import 'package:practice43/fetures/users/presintation/widgets/main_info_card.dart';

import 'package:practice43/fetures/users/presintation/widgets/row_info.dart';
import 'package:practice43/internal/dependencies/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UsersBloc usersBloc;

  @override
  void initState() {
    usersBloc = getIt<UsersBloc>();
    usersBloc.add(GetRandomUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BlocConsumer<UsersBloc, UsersState>(
          bloc: usersBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UsersLoadedState) {
              return Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: CachedNetworkImage(
                        imageUrl:
                            state.userModel.results?.first.picture?.large ?? '',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                          height: 40,
                          width: 40,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: '${state.userModel.results!.first.name!.title} ',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '${state.userModel.results!.first.name!.first} '),
                          TextSpan(
                            text:
                                '${state.userModel.results!.first.name!.last}',
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const TabBar(
                    labelPadding: EdgeInsets.symmetric(vertical: 20),
                    // padding: EdgeInsets.symmetric(vertical: 20),
                    indicatorColor: Colors.red,
                    labelColor: Colors.black,
                    tabs: [
                      Text(
                        'Main info',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      children: [
                        MainInfoCard(
                          name:
                              state.userModel.results?.first.name?.title ?? '',
                          nameF:
                              state.userModel.results?.first.name?.first ?? '',
                          nameL:
                              state.userModel.results?.first.name?.last ?? '',
                          gender: state.userModel.results?.first.gender ?? '',
                          bDay:
                              '${state.userModel.results?.first.dob?.date ?? ''}',
                          age:
                              '${state.userModel.results?.first.dob?.age ?? ''}',
                        ),
                        LocationInfoCard(
                          phoneNumber:
                              state.userModel.results?.first.phone ?? '',
                          location: state
                                  .userModel.results?.first.location?.country ??
                              '',
                          city: state.userModel.results?.first.location?.city ??
                              '',
                          email: state.userModel.results?.first.email ?? '',
                          age:
                              '${state.userModel.results?.first.dob?.age ?? ''}',
                        ),
                        EmailInfoCard(
                          name:
                              state.userModel.results?.first.name?.title ?? '',
                          email: state.userModel.results?.first.email ?? '',
                          userName:
                              state.userModel.results?.first.login?.username ??
                                  '',
                          phone: state.userModel.results?.first.phone ?? '',
                          cell: state.userModel.results?.first.cell ?? '',
                          registred:
                              '${state.userModel.results?.first.registered?.date ?? ''}',
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      usersBloc.add(GetRandomUserEvent());
                    },
                    child: Text('Поиск'),
                  ),
                ],
              );
            }

            return Center(
              child: Column(
                children: [],
              ),
            );
          },
        ),
      ),
    );
  }
}

class EmailInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String userName;
  final String phone;
  final String cell;
  final String registred;

  const EmailInfoCard({
    super.key,
    required this.name,
    required this.email,
    required this.userName,
    required this.phone,
    required this.cell,
    required this.registred,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          RowInfo(
            title: 'Name',
            subTitle: name,
          ),
          RowInfo(
            title: 'Email',
            subTitle: email,
          ),
          RowInfo(
            title: 'User Name',
            subTitle: userName,
          ),
          RowInfo(
            title: 'Phone',
            subTitle: phone,
          ),
          RowInfo(
            title: 'Cell',
            subTitle: cell,
          ),
          RowInfo(
            title: 'Registred',
            subTitle: registred,
          )
        ],
      ),
    );
  }
}
