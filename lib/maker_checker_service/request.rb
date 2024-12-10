module MakerCheckerService
  class MakerCheckerRequest < ActiveRecord::Base
      self.table_name = "maker_checker_requests"

      enum status: { pending: 0, approved: 1, denied: 2 }

      belongs_to :maker, class_name: 'User'
      belongs_to :checker, class_name: 'User', optional: true

      # New attributes
      attr_accessor :required_approvals
      has_many :approvals, class_name: 'MakerCheckerApproval', dependent: :destroy

      def escalated?
        return self.escalated_at.present?
      end

      def add_approval_by(checker)
        approvals.create(checker: checker) # this will log all checkers who have approved this request
        if approvals.count >= required_approvals
          self.update!(status: :approved)
        end
      end
  end
end

