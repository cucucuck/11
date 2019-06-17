require 'travis/yml/docs/page/render'

module Travis
  module Yml
    module Docs
      module Page
        class Menu < Obj.new(:pages, :opts)
          include Helper::Obj, Render

          HIDE = %i(
            arch
            env_var
            env_vars
            import
            matrix_entries
            matrix_entry
            os
            service
            stage
          )

          def render
            super(:menu)
          end

          def pages
            pages = super.values
            pages = pages.reject { |page| hide?(page) }
            root  = pages.detect(&:root?)
            pages = pages - [root]
            groups = pages.group_by(&:namespace)
            pages = [root, *groups[:type], *groups[nil]]
            pages = pages.map(&:id).zip(pages).to_h
            groups = except(groups, :type)
            curr = pages[current.to_sym]
            curr.children = groups[current.sub(/s$/, '').to_sym] if curr
            pages.values
          end

          def hide?(page)
            HIDE.include?(page.id) || page.is_a?(Static) || page.deprecated?
          end

          def active?(page)
            page.path =~ /#{current.split('/').first}s?$/
          end

          def current
            opts[:current]
          end
        end
      end
    end
  end
end
