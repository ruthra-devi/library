$("#new_user").validate({
    //error place
    errorPlacement: function (error, element) {
      error.insertBefore(element);
    },
  //adding rule
    rules: {
    // username is required with max of 20 and min of 6
    "user[user]":{
      required: true,
      maxlength: 20,
      minlength: 6
    },
    // email is required with format
    "user[email]": {
      required: true,
      email: true
    },
    // password is required
    "user[password]": {
      required: true
    },
    // password_confirmation is required and is the same with password
    "user[password_confirmation]": {
      required: true,
      equalTo: "#user_password"
    },
    // introduction is optional with maxlenght 500
    "user[password_confirmation]": {
      maxlength: 500
    }
    },
    // error messages
    messages: {
      name:{
        required: "name is required.",
        maxlength: "name must be less than 20",
        minlength: "name must be more than 6"
      },
      email:{
        required: "Email is required",
        email: "Please enter a valid email address"
      },
      password: {
        required: "Password is required"
      },
      password_confirmation: {
        required: "Password confirmation is required",
        equalTo: "Password and password confirmation must be same"
      }
    }
  });
  