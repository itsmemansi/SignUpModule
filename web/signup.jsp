<%-- 
    Document   : signup.jsp
    Created on : Dec 25, 2021, 1:04:06 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Compiled and minified CSS -->
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

       <!-- Compiled and minified JavaScript -->
       <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
    </head>
    <body style="background-image: url(img/RegistrationModuleBackgroundImage.jpg); background-size: cover; background-attachment: fixed">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top: 10px;" class="center-align">Signup  here !!</h3>
                            <h5 id="msg" class="center-align"></h5>
                            <h5 id="msg1" class="center-align"></h5>
                            <!--creating form..-->
                            <div class="form center-align">
                                <form action="register" method="post" id="myForm">
                                    <input type="text"  name="user_name" placeholder="Enter user name"  required/>
                                    <input type="password"  name="user_password" placeholder="Enter user password"  id = "pswd" required/>
                                    <input type="email"  name="user_email" placeholder="Enter user email"required />
                                    
                                     <div class="file-field input-field">
                                           <div class="btn light-blue accent-3">
                                           <span>File</span>
                                           <input name="image" type="file" required>
                                           </div>
                                          <div class="file-path-wrapper">
                                          <input class="file-path validate" type="text">
                                          </div>
                                    </div>
                                    
                                    <button type="submit" class="btn  light-blue accent-3" id="btn">Submit</button>
                                </form>
                            </div>
                            
                            <!--creating loader-->
                            <div class="loader center-align" style="margin-top: 10px; display: none"> 
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue-only">
                                         <div class="circle-clipper left">
                                               <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                               <div class="circle"></div>
                                       </div>
                                        <div class="circle-clipper right">
                                              <div class="circle"></div>
                                        </div>
                                   </div>
                                </div>
                                <h5>Please wait...</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous">
        </script>
         <script>
             $(document).ready(function()
             {
                 console.log("Page is ready");
                 $("#myForm").on('submit',function (event){
                     event.preventDefault();  
                     let f = new FormData(this); 
                     console.log(f);
                     $(".loader").show();
                     $(".form").hide();
                     $.ajax({
                         url: "register",
                         data: f,
                         type: 'POST',
                         success: function (data, textStatus, jqXHR) 
                         {
                                console.log(data);
                                console.log("Success...");
                                $(".loader").hide();
                                $(".form").show();
                                if(data.trim() === "done" )
                                {
                                    if( document.getElementById("pswd").maxLength === "8")
                                    {
                                              $("#msg").html("Successfully Registered !!");
                                              $("#msg").addClass("green-text");
                                    }
                                    else
                                    {
                                              $("#msg").html("Password length is exceeded");
                                              $("#msg").addClass("red-text");
                                              $("#btn").on("click",function ()
                                              {
                                                  $(".loader").hide();
                                                  $(".form").show();
                                                  $("#msg").hide();
                                                  $("#msg1").html("Successfully Registered !!");
                                                  $("#msg1").addClass("green-text");
                                              });
                                    }
                                }
                                else
                                {
                                       $("#btn").on("click",function ()
                                       {
                                                  $(".loader").hide();
                                                  $(".form").show();
                                                   $("#msg").html("Something went wrong on server.. !!");
                                                   $("#msg").addClass("red-text");
                                        });
                               }
                         },
                      error: function (jqXHR, textStatus, errorThrown) 
                      {
                              console.log(data);
                              console.log("Error...");
                              $(".loader").hide();
                              $(".form").show();
                              $("#msg").html("Something went wrong on server.. !!");
                              $("#msg").addClass("red-text");
                      },
                      processData: false,
                      contentType: false
                     })
                 })
             })
         </script>
    </body>
</html>
