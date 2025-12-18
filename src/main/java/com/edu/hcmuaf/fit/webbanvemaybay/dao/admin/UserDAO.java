package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;


import java.util.List;

public class UserDAO extends DBContext {
    public List<User> getListUser() {
        return get().withHandle(h -> {
            return h.createQuery("SELECT id, username, password, so_dien_thoai AS soDienThoai, " +
                    "email, code_xac_thuc AS codeXacThuc, hang_xac_thuc AS hangXacThuc " +
                    "FROM users").mapToBean(User.class).list();
        });
    }
}

