# frozen_string_literal: true
module MakerCheckerService
  class MakerCheckerService

    Escalation_roles = YAML.load_file("#{Rails.root}/config/maker_checker/escalations/escalation_roles.yml")&.deep_symbolize_keys# these should be based on where we escalate requests depening on the action.
    # this can be a YML that we can fetch this permissions from.
    # Approve a single request
    def approve_request(request, user, justification)
        ActiveRecord::Base.transaction do
          request.add_approval_by(checker)
          #PerformActionJob.perform(request) # Action is performed first
          request.update!(
            status: :approved,
            checker_id: user.id,
            checker_justification: justification,
            action_performed_at: Time.current
          )
        end
    end


    # Deny a single request
    def deny_request(request, user, justification)
      request.update!(
        status: :denied,
        checker_id: user.id,
        checker_justification: justification
      )
    end

    # Escalate a single request
    def escalate_request(request)
      return if request.escalated? # Prevent duplicate escalations
      escalation_role = Escalation_roles[request.action]
      if escalation_role
        request.update(escalated_to: escalation_role , escalated_at: Time.current)
        #notify_escalation(admin_user, request)
      end
    end

    # Bulk approve requests
    def bulk_approve_requests(request_ids, user, justification)
      MakerCheckerRequest.find(request_ids).each do |request|
        approve_request(request, user, justification)
      end
    end

    # Bulk deny requests
    def bulk_deny_requests(request_ids, user, justification)
      MakerCheckerRequest.find(request_ids).each do |request|
        deny_request(request, user, justification)
      end
    end

    # Bulk escalate requests
    def bulk_escalate_requests(request_ids)
      MakerCheckerRequest.find(request_ids).each do |request|
        escalate_request(request)
      end
    end
  end
end
