module ApplicationHelper
    def login_link
        current_user.present? ? 
        content_tag(:li, link_to("Salir", destroy_user_session_path))
        : 
        content_tag(:li, link_to("Iniciar sesión", new_user_session_path))
    end

    def report_link
        current_user.present? ? 
        content_tag(:li, link_to("Reporte de sobre peso", report_admin_packages_path))
        : 
        ""
    end
end