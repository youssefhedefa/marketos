class Failure{
  final String message;

  Failure({required this.message});

  @override
  String toString() => message;

 factory Failure.fromFirebase({required String message}) {
   if(message.contains('user-not-found')){
     return Failure(message: 'User not found');
    }else if(message.contains('wrong-password')){
     return Failure(message: 'Wrong password');
    }else if(message.contains('email-already-in-use')){
      return Failure(message: 'Email already in use');
    }else if(message.contains('weak-password')){
      return Failure(message: 'Weak password');
    }else if(message.contains('invalid-email')){
      return Failure(message: 'Invalid email');
    }else if(message.contains('network-request-failed')){
      return Failure(message: 'Network request failed');
    }else if(message.contains('user-disabled')){
      return Failure(message: 'User disabled');
    }else if(message.contains('too-many-requests')){
      return Failure(message: 'Too many requests');
    }else if(message.contains('operation-not-allowed')){
      return Failure(message: 'Operation not allowed');
    }else if(message.contains('requires-recent-login')){
      return Failure(message: 'Requires recent login');
    }else if(message.contains('invalid-verification-code')){
      return Failure(message: 'Invalid verification code');
    }else if(message.contains('invalid-credential')){
      return Failure(message: 'Email or password is incorrect');
    }
    return Failure(message: message);
 }



}