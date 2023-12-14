			function allowOnlyNumbers(e, t)   
                    {    
                       if (window.event)    
                       {    
                          var charCode = window.event.keyCode;    
                       }    
                       else if (e)   
                       {    
                          var charCode = e.which;    
                       }    
                       else { return true; }    
                       if ((charCode >=48 && charCode <=57))
                           return  true;    
                       else  
                       {    
                          alert("Please enter only number");    
                          return false;    
                       }           
                    }   
					
					function allowOnlyChar(e, t)   
                    {    
                       if (window.event)    
                       {    
                          var charCode = window.event.keyCode;    
                       }    
                       else if (e)   
                       {    
                          var charCode = e.which;    
                       }    
                       else { return true; }    
                       if ((charCode >=65 && charCode <=90))
                           return  true;    
                       if ((charCode >=97 && charCode <=122))
                           return  true;    
                       else  
                       {    
                          alert("Please enter only alphabet");    
                          return false;    
                       }           
                    } 
					
					function Home()
					{
						window.open("menu.html","_self")
					}
 