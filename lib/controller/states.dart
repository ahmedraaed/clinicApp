abstract class AppStates {}

class InitState extends AppStates{}


class RegisterLoadingState extends AppStates{}
class RegisterSucssesState extends AppStates{}

class RegisterErrorState extends AppStates{
  final String Error;
  RegisterErrorState(this.Error);
}

class CreatdataSucssesState extends AppStates{}

class CreatdataErrorState extends AppStates{
  final String Error;
  CreatdataErrorState(this.Error);
}



class showdataStateone extends AppStates{}

class hidedataStateone extends AppStates{}

class showdataStatetwo extends AppStates{}

class hidedataStateonetwo extends AppStates{}

class showdataStatethree extends AppStates{}

class hidedataStateonethree extends AppStates{}





class pickedScseecedstate extends AppStates{}

class pickedErrorstate extends AppStates{}

class Loadingpickedstate extends AppStates{}

class UploadScseecedstate extends AppStates{

}

class UploadErrorstate extends AppStates{}



class loadClinic extends AppStates{}
class addClinic extends AppStates{}




class Errorpermisson extends AppStates{}
class Sucssedpermisson extends AppStates{}


class record extends AppStates{}
class stoprecord extends AppStates{}


class changeIconrecord extends AppStates{}


