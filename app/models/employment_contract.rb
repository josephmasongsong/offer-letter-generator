class EmploymentContract < ApplicationRecord
  belongs_to :department
  belongs_to :position
  belongs_to :employee
  belongs_to :supervisor, class_name: 'User', foreign_key: :supervisor_id, optional: true

  enum compensation_type: [:"Casual (No guaranteed hours)", :"Hourly part-time (12 - 23 hrs per week)", :"Hourly full-time (24 - 40 hrs per week)", :"Salaried full-time"]
  enum pay_frequency: [:hourly, :annually]

  enum vacation_time: [:"4% standard accrual = 2 weeks annually", :"4% paid out each pay period (for casual staff)"]
  enum cellphone_allowance: [:"Monthly $20", :"Monthly $40", :"Potluck to supply with company phone", :"No cellphone allowance required"]

  # validates :compensation, :pay_frequency, :start_date, :compensation_type, presence: true

  has_settings do |s|
    s.key :offer_body, defaults: { 
      introduction: "Further to our recent discussions, %{department} is pleased to offer you employment on the basis, terms and conditions described in this letter. Please review these terms and conditions careful and confirm your understanding and agreement to them by signing this letter where indicated below.",
      job_classification: "Please note due to seasonal fluctuations in Potluck business, we cannot always guarantee consistent hours of work to any employee. Signature of this agreement acknowledges your understanding and acceptance of this term and condition of employment.",
      start_date: "Your employment will commence on %{start_date}.",
      wage_salary: "Your salary is %{compensation} / %{pay_frequency} and will be payable bi-weekly.",
      vacation: "Your vacation entitlement is %{vacation}. %{vacation_other}",
      probationary_period: "The probation period is 3 months from th start date during which time this employment agreement can be terminated by either the Company or the employee without notice or payment of severance.",
      termination: "After completion of the probationary period, the employee may terminate this agreement up providing a minimum 2 weeks' written notice. After completion of the probationary period, the Employer may terminate the agreement with or without cause according to BC Employment Standards.",
      group_insurance_benefits: "You are eligible to participate in Potluck's %{classification} Group Basic Health & Dental Insurance Benefits Program starting after 6 months of continuous employment. Coverage under this program is detailed in our Group Insurance Benefits Booklets and may be updated from time to time. The ongoing, monthly cost of enrolment in this Group Insurance Benefits Program will be paid 100%% by %{department} and is considered taxable income benefit. Enrolment is based on continuous employment from the employment start date. Part Time or Full Time benefits program coverage is determined by the number of continuous and regular weekly hours of work. Part Time benefits eligibility applies to those employees who continually work 15 to 23 hours per week. Full Time benefits eligibility applies to those employees who continually work 24 to 40 hours per week. Enrollment of any employee commences after 6 months of continuous employment.",
      dress_code: "All Potluck employees are responsible for adhering to the Potluck dress code which is outline in the Potluck Book of Knowledge. Delivery Drivers and Event Staff are required to adhere to specific Potluck uniform requirements. Uniforms for Drivers and Event staff are supplied by and remain the property of Potluck, requiring return after the termination of the employment relationship. Delivery Drivers also receive a laundry allowance. This is a taxable benefit.",
      equipment: "All Potluck employees are responsible for adhering to the Potluck dress code which is outline in the Potluck Book of Knowledge. Delivery Drivers and Event Staff are required to adhere to specific Potluck uniform requirements. Uniforms for Drivers and Event staff are supplied by and remain the property of Potluck, requiring return after the termination of the employment relationship. Delivery Drivers also receive a laundry allowance. This is a taxable benefit.",
      confidential_information: "You hereby acknowledge that in the course of performing your work, you will have access to and be entrusted with information concerning confidential matters and trade secrets of Potluck including but not limited to clients, pricing, marketing, and training policies and techniques. Disclosure of this confidential information to competitors or other persons would be detrimental to the best interests of Potluck. Accordingly, you agree that you will not disclose any confidential information about Potluck to any person or use directly or indirectly the confidential information for any other purpose other than to perform your duties.",
      performance_reviews: "At its discretion, Potluck Managers will review the employee's performance, salary, and benefits. Following such review the employee's salary may be reviewed at the sole discretion of Potluck.",
      employment_policies: "All Potluck employment policies and guidelines can be found in the Potluck Book of Knowledge.",
      allowances: "%{other} %{bonus} %{professional_development}"
      }
  end

end
