class Notification < ApplicationMailer


def completed_assignments(aassignment)
	@assignment = assignment
    mail to: "raag.ices@gmail.com",
    cc: "gajendra.qubik.gmail.com",
    subject: "#{ @assignment.name} has been completed"
end


def pending_assignments(asssignment)
	 @assignment = assignment
    mail to: "gajendra.qubik@gmail.com",
    cc: "business@qubik.in",
    subject: "#{ @assignment.name } has crossed the due date."
end

end