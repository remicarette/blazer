module Blazer

    class SmartVariablesController < BaseController
        def index
            @smart_variables = SmartVariable.order(id: :desc)
        end
    
        def new
            @smart_variable = SmartVariable.new
            @keys = load_keys
        end
    
        def create 
            @smart_variable = SmartVariable.new(smart_variable_params)
            if @smart_variable.save
                redirect_to smart_variables_path, notice: "Smart Variable created"
            else
                render :new
            end
        end
    
        def edit
            @smart_variable = SmartVariable.find(params[:id])
            @keys = load_keys
        end
    
        def update 
            @smart_variable = SmartVariable.find(params[:id])
            if @smart_variable.update(smart_variable_params)
                redirect_to smart_variables_path, notice: "Smart Variable updated"
            else
                render :edit
            end
        end
    
        def destroy
            @smart_variable = SmartVariable.find(params[:id])
            @smart_variable.destroy
            redirect_to smart_variables_path, notice: "Smart Variable deleted"
        end
    
        private 
    
        def load_keys
            @keys = SmartVariable.all.select(:key).map(&:key)
        end
    
        def smart_variable_params
            params.require(:smart_variable).permit(:key, :value)
        end
    end
end