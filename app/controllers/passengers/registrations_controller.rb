# app/controllers/passengers/registrations_controller.rb

class Passengers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def new
    super
  end

  def create
    build_resource(sign_up_params)

    if resource.valid?(:validate_email_and_mobile)
      # Generate a 4-digit OTP
      resource.otp = rand(1000..9999).to_s

      if resource.save(validate: false)
        # Send OTP to passenger's email (replace this with your actual OTP sending logic)
        resource.update(verification_code: resource.otp)
        send_otp(resource)
        
        # Redirect to a page to confirm OTP
        redirect_to confirm_otp_path(resource)
        return
      end
    end

    clean_up_passwords resource
    set_minimum_password_length
    respond_with resource
  end

  def confirm_otp
    @passenger = resource_class.find(params[:id])
  end

  def verify_otp
    @passenger = Passenger.find(params[:id])
    binding.pry
    if @passenger.verification_code == params[:otp]
      # OTP verified, continue with the registration process
      if @passenger.update(sign_up_params)
        sign_in(@passenger) # Automatically sign in the passenger after registration
        redirect_to root_path # Redirect to the desired path after successful registration
      else
        @passenger.errors.add(:otp, "SOmething wrong OTP")
        render :confirm_otp
      end
    else
      @passenger.errors.add(:otp, "Invalid OTP")
      render :confirm_otp
    end
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :contact_no])
  end

  def send_otp(passenger)
    # Implement your OTP sending logic here (e.g., send an email)
    # For simplicity, let's just print it to the console
    puts "OTP for #{passenger.email}: #{passenger.otp}"
  end
end
