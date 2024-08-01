class Failure{
  final String message;

  Failure({required this.message});

  @override
  String toString() => message;

  //get getMessage => message;

 get getMessage {
   if(message.contains('user-not-found')){
     return 'User not found';
    }else if(message.contains('wrong-password')){
     return 'Wrong password';
    }else if(message.contains('email-already-in-use')){
      return 'Email already in use';
    }else if(message.contains('weak-password')){
      return 'Weak password';
    }else if(message.contains('invalid-email')){
      return 'Invalid email';
    }else if(message.contains('network-request-failed')){
      return 'Network request failed';
    }else if(message.contains('user-disabled')){
      return 'User disabled';
    }else if(message.contains('too-many-requests')){
      return 'Too many requests';
    }else if(message.contains('operation-not-allowed')){
      return 'Operation not allowed';
    }else if(message.contains('requires-recent-login')){
      return 'Requires recent login';
    }else if(message.contains('invalid-verification-code')){
      return 'Invalid verification code';
    }else if(message.contains('invalid-credential')){
      return 'Invalid credential';
    }
    return message;
 }

}