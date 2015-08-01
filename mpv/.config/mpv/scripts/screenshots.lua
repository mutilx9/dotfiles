function change_screenshot_template(event)
	if tonumber(mp.get_property('duration')) > 3600 then
		mp.set_property('options/screenshot-template', '%f_snapshot_%wH.%wM.%wS_[%tY.%tm.%td_%tH.%tM.%tS]')
	end
end

mp.register_event('file-loaded', change_screenshot_template)
