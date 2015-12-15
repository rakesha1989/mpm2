class Notification < ApplicationMailer


def completed_assignment(assignment)
	@assignment = assignment
    mail to: "raki4ever@gmail.com",
    cc: "gajendra.qubik@gmail.com",
    subject: "#{ @assignment.name} has been completed"
end


def incomplete_assignment(assignment)
	 @assignment = assignment
    mail to: "gajendra.qubik@gmail.com",
    cc: "business@qubik.in",
    subject: "#{ @assignment.name } has crossed the due date."
end

end