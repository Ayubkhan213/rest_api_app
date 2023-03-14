class Api {
  static const hostConnect = "https://apiclothsstore.000webhostapp.com";
  static const hostConnectUsers = "$hostConnect/users";
  // Validate Email
  static const validateEmail = "$hostConnectUsers/validate_email.php";
  // SignUp Connection
  static const signUp = "$hostConnectUsers/signup.php";
  // login Connection
  static const login = "$hostConnectUsers/login.php";

  //crud
  static const crud = "$hostConnect/cruds";
  //Get data
  static const getData = "$crud/selection.php";
  //Send data
  static const sendData = "$crud/insert.php";
  //Delete data
  static const deleteData = "$crud/delete.php";
  //Update data
  static const updateData = "$crud/update.php";
}
