require 'sucker_punch'

module DelayedPaperclip
  module Jobs
    class SuckerPunch
      include ::SuckerPunch::Job

      def self.enqueue_delayed_paperclip(instance_klass, instance_id, attachment_name)
        perform_async(instance_klass, instance_id, attachment_name)
      end

      def perform(instance_klass, instance_id, attachment_name)
        DelayedPaperclip.process_job(instance_klass, instance_id, attachment_name)
      end
    end
  end
end
