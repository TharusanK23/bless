part of splashview;

class _SplashBody extends ViewModelWidget<SplashViewModel> {
  const _SplashBody({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, SplashViewModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo/bless-logo-1.png'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo/bless-logo-2.png'),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget> [
            CupertinoActivityIndicator()
          ],
        )
      ],
    );
  }
}
