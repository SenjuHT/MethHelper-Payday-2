local ingredient_dialog = {}
toggle_ingredients_chat = true
ingredient_said = false
--ingredient_dialog["pln_rt1_12"] = "" 
ingredient_dialog["pln_rt1_20"] = "Соляная Кислота Muriatic Acid" 
ingredient_dialog["pln_rt1_22"] = "Каустическая Сода Caustic Soda"
ingredient_dialog["pln_rt1_24"] = "Хлористый Водород Hydrogen Chloride"
ingredient_dialog["pln_rt1_28"] = "Плов готов Meth ready"
ingredient_dialog["pln_rat_stage1_20"] = "Соляная Кислота Muriatic Acid."
ingredient_dialog["pln_rat_stage1_22"] = "Каустическая Сода Caustic Soda"
ingredient_dialog["pln_rat_stage1_24"] = "Хлористый Водород Hydrogen Chloride"
ingredient_dialog["pln_rat_stage1_28"] = "Плов Готов Meth ready"
ingredient_dialog["Play_loc_mex_cook_03"] = "Соляная Кислота Muriatic Acid" 
ingredient_dialog["Play_loc_mex_cook_04"] = "Каустическая Сода Caustic Soda"
ingredient_dialog["Play_loc_mex_cook_05"] = "Хлористый Водород Hydrogen Chloride"
ingredient_dialog["Play_loc_mex_cook_13"] = "Плов готов Meth ready"



local _queue_dialog_orig = DialogManager.queue_dialog
function DialogManager:queue_dialog(id, ...)
    if ingredient_dialog[id] == last_ingredient then
	ingredient_said = true
    else
	ingredient_said = false
    end
    if ingredient_dialog[id] and toggle_ingredients_chat and not ingredient_said then
	managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", ingredient_dialog[id]) 
	last_ingredient = ingredient_dialog[id]
    elseif ingredient_dialog[id] and not toggle_ingredients_chat then
	managers.hud:show_hint({text = ingredient_dialog[id]})
	last_ingredient = ingredient_dialog[id]
    end
    if ingredient_dialog[id] == "Соляная Кислота Muriatic Acid" or ingredient_dialog[id] == "Каустическая Сода Caustic Soda" or ingredient_dialog[id] == "Хлористый Водород Hydrogen Chloride" then
	ingredient_said = true
    end
    return _queue_dialog_orig(self, id, ...)
end


