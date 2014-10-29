class HospitalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @doctors=current_user.doctors
    @patients=current_user.patients
    @appointments=current_user.appointments
  end

  def create_patient
    Patient.create(:name=>params["patient"]["name"],:phone_number=>params["patient"]["phone_number"],:user_id=>current_user.id)
    redirect_to root_path
  end

  def create_doctor
    Doctor.create(:name=>params["doctor"]["name"],:phone_number=>params["doctor"]["phone_number"],:specialization=>params["doctor"]["specialization"],:user_id=>current_user.id)
    redirect_to root_path
  end

  def create_appointment
    Appointment.create(:doctor_id=>params["appointment_doctor"],:patient_id=> params["appointment_patient"],:diseases=>params["appointment"]["diseases"],:user_id=>current_user.id)
    redirect_to root_path
  end
end
