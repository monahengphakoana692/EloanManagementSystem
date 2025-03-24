   
       function callJSPMethods(pageName) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", pageName + ".jsp?page=" + pageName, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("formHolder").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
            
        }
       
       
        
      