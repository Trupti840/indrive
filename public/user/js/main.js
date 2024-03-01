if ($(".dropdown").length) {
    $(document).on("click", ".dropdown-menu .dropdown-item", function (e) {
        e.preventDefault();
        if (!$(this).hasClass("active")) {
            var swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: "btn btn-primary",
                    cancelButton: "btn btn-danger me-3",
                },
                buttonsStyling: false,
            });
            swalWithBootstrapButtons
                .fire({
                    title: "Are you sure?",
                    text: "Do you really want to change your current language!",
                    icon: "warning",
                    confirmButtonText: "<i class='fas fa-check-circle me-1'></i> Yes, I am!",
                    cancelButtonText: "<i class='fas fa-times-circle me-1'></i> No, I'm Not",
                    showCancelButton: true,
                    reverseButtons: true,
                    focusConfirm: true,
                })
                .then((result) => {
                    if (result.isConfirmed) {
                        if (!$(this).hasClass("active")) {
                            $(".dropdown-menu .dropdown-item").removeClass("active");
                            $(this).addClass("active");
                            $(this)
                                .parents(".dropdown")
                                .find(".btn")
                                .html("<span class='flag-icon flag-icon-us me-1'></span>" + $(this).text());
                        }
                        Swal.fire({
                            icon: "success",
                            title: "Amazing!",
                            text: "Your current language has been changed successfully.",
                            showConfirmButton: false,
                            timer: 1500,
                        });
                    }
                });
        }
    });
}


// function toggleValueButtons() {
//   var valueButtons = document.querySelector('.value-buttons');
//   valueButtons.style.display = (valueButtons.style.display === 'none') ? 'flex' : 'none';
// }

// function updateNumberValue(value) {
//   var numberInput = document.getElementById('number');
//   numberInput.value = value;
// }

// function increaseValue() {
//   var numberInput = document.getElementById('number');
//   var value = parseInt(numberInput.value, 10);
//   value = isNaN(value) ? 0 : value;
//   value++;
//   numberInput.value = value;
// }

// function decreaseValue() {
//   var numberInput = document.getElementById('number');
//   var value = parseInt(numberInput.value, 10);
//   value = isNaN(value) ? 0 : value;
//   value < 1 ? value = 1 : '';
//   value--;
//   numberInput.value = value;
// }

function getCurrentDateTime() {
            var currentDate = new Date();
            var year = currentDate.getFullYear();
            var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
            var day = currentDate.getDate().toString().padStart(2, '0');
            var hours = currentDate.getHours().toString().padStart(2, '0');
            var minutes = currentDate.getMinutes().toString().padStart(2, '0');
            return year + "-" + month + "-" + day + "T" + hours + ":" + minutes;
        }

// Set the default value of the date input to the current date
document.getElementById("today_date").value = getCurrentDateTime();

 function toggleSection() {
    var hiddenSection = document.getElementById("hiddenSection");
    hiddenSection.style.display = (hiddenSection.style.display === "none") ? "block" : "none";
}

function displayValue() {
    var inputElement = document.getElementById("inputField");
    var inputValue = inputElement.value;

    var displayInput = document.getElementById("displayInput");
    displayInput.value = inputValue;

    var hiddenInput = document.getElementById("hiddenInput");
    hiddenInput.value = inputValue;
}

function incrementValue(e) {
    e.preventDefault();  // Prevent the default behavior of the event

    var inputElement = document.getElementById("inputField");
    var inputValue = parseInt(inputElement.value) || 0;  // Default to 0 if NaN
    inputElement.value = inputValue + 1;
    displayValue();
}

function decrementValue(e) {
    e.preventDefault();  // Prevent the default behavior of the event

    var inputElement = document.getElementById("inputField");
    var inputValue = parseInt(inputElement.value) || 0;  // Default to 0 if NaN
    inputElement.value = inputValue - 1;
    displayValue();
}


