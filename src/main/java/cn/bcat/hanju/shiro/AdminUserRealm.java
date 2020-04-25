package cn.bcat.hanju.shiro;

import cn.bcat.hanju.admin.service.AdminLoginService;
import cn.bcat.hanju.pojo.admin.AdminUser;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

/**
 * 自定义realm
 */
public class AdminUserRealm extends AuthorizingRealm {
    @Autowired
    private AdminLoginService adminLoginService;

    // 授权方法
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("授权方法执行了........");

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

        String userName = (String) principals.getPrimaryPrincipal();
        AdminUser adminUser = adminLoginService.getAdminUserByUserName(userName);
        //设置角色
        Set<String> roles = adminLoginService.getRolesByUserType(adminUser.getUsertype());
        authorizationInfo.setRoles(roles);
        //设置权限
        Set<String> permission = adminLoginService.getPermissionByUserType(adminUser.getUsertype());
        authorizationInfo.setStringPermissions(permission);

        return authorizationInfo;
    }

    // 认证方法
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("------自定义realm执行了认证方法......");
        // 1,token中获取username
        String username = (String) token.getPrincipal();
        // 2,去数据库中查询用户信息根据用户名
        AdminUser adminUser = adminLoginService.getAdminUserByUserName(username);

        if (adminUser == null) {
            // 3，用户不存在，返回null框架抛出异常，到controller进行统一处理
            return null;
        }
        // 4，到这里说明数据已经查询到了，让shiro进行对页面提交的密码和数据库中的密码进行校验
        // 第一个:参数数据库查询出来的用户对象，第二个:数据库密码，第三个参数:当前Realm名字
        if (adminUser.getUsertype()==0 || adminUser.getUsertype()==1){
            // 判断是否0或1（admin用户或测试用户）
            AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(adminUser.getUsername(), adminUser.getPassword(), getName());
            return authenticationInfo;
        }else {
            return null;
        }


    }

}

