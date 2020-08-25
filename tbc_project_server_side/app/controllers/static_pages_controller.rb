class StaticPagesController < ApplicationController
    def root
        render :welcome
    end
end
