Return-Path: <SRS0=0+k7=45=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75330C10DCE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Mar 2020 11:41:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EBDC206E9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Mar 2020 11:41:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="KCy2kOsn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EBDC206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vip.qq.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a72af4b2;
	Thu, 12 Mar 2020 11:36:21 +0000 (UTC)
Received: from qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id be7a3928
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Mar 2020 11:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1584013303; bh=uny5t8rwWuAe5TtQE8cMRVf9UQBDfIbfgkMepdzuHRE=;
 h=From:To:Cc:Subject:Date;
 b=KCy2kOsnjzYZkOq+eSilyLIULR2FItBoMxKsDPF0BR69MzcfOs7g5BXdbqwpH9r7h
 AWoTx5TcJq8cKzngiDQocOkqXbVG6LxfFK9wz6L0iNXUB4IyD0OxnxhMQNMHcSBz4+
 RqsWFp5sYDyxOik1DdqVvDPlQHTEmUnVf0p5e11U=
Received: from localhost.localdomain ([240e:30c:203:ff08:41ca:9f21:415a:33e9])
 by newxmesmtplogicsvrszb1.qq.com (NewEsmtp) with SMTP
 id A650A872; Thu, 12 Mar 2020 19:41:37 +0800
X-QQ-mid: xmsmtpt1584013297tv2p6i3ks
X-QQ-XMAILINFO: NkGKqrz1RktM/XERKSBZPWJz1NNiwHCIBuPC0v6DOOQRxeD2XwtzDpXgH2Uip1
 fSYvusXV+hX3QMvyxh78XKOsS5z1w1SZrtymnw0ewoliwDwe3eh/18OW0lJ2suAgZhXoMJwZRLTK
 38XuTaBI2TcBMvxzDM/sl8tAh5dtkOBP2kY0UKK3iGfK5W6nVUn3xU1H2s9zZYF1dBrv41TEev43
 NgZj/MsfMefglfhmQ6QDNdJs70fq8GqzJdPzuJdCZed+5KYg3EXrXEGaB5LsVw0wZ1d0EWJSN3A6
 Bu9/38erLxtMme+LYoE2cE06PblbgSx2bORw5uTap82ENaPH3wz567AIijAo+KqtJXAMXIzM9F9I
 cuV1cJevzIUDis66yPZ6iHnWbYv4ME3vfEqvCxWyI99KanojYcNxlonzH8AONrkc+NX7MOS9353V
 GRrWPDNxShEfy0nxrfngqIHPget9a3OQmIIs4SrVCHJ++iA+uOtVLISzo+DtehyBMsP8iyS2mvMs
 F8h24w4rRAg64YN3LaOWsknbUuFNJ0lSvkoHWKUuNtP0Qo/qZPyZf4YwMObjE+Ezz1qrf17uLNET
 4HEld50vfOn/IV4WImzPI/s0/FwhZiIqVRaM5Fwpw6HGFhjHqXdOvB7ySH82ZUvixuHME=
From: srb12345@vip.qq.com
To: wireguard@lists.zx2c4.com
Cc: LilligantMatsuri <srb12345@vip.qq.com>
Subject: [PATCH] Update Simplified Chinese translation
Date: Thu, 12 Mar 2020 19:40:41 +0800
Message-Id: <20200312114041.470-1-srb12345@vip.qq.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

From: LilligantMatsuri <srb12345@vip.qq.com>

Signed-off-by: LilligantMatsuri <srb12345@vip.qq.com>
---
 ui/src/main/res/values-zh-rCN/strings.xml | 40 ++++++++++++++---------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/ui/src/main/res/values-zh-rCN/strings.xml b/ui/src/main/res/values-zh-rCN/strings.xml
index c8175f1..d3243f9 100644
--- a/ui/src/main/res/values-zh-rCN/strings.xml
+++ b/ui/src/main/res/values-zh-rCN/strings.xml
@@ -20,7 +20,7 @@
     </plurals>
     <string name="add_peer">添加节点</string>
     <string name="addresses">局域网 IP 地址</string>
-    <string name="allowed_ips">允许的 IP 地址（段）</string>
+    <string name="allowed_ips">路由的 IP 地址（段）</string>
     <string name="app_name">WireGuard</string>
     <string name="bad_config_context">%1$s 的 %2$s 字段</string>
     <string name="bad_config_context_top_level">%s</string>
@@ -49,7 +49,7 @@
     <string name="config_save_success">已保存 “%s” 的配置</string>
     <string name="create_activity_title">创建 WireGuard 隧道</string>
     <string name="create_bin_dir_error">无法创建本地二进制文件目录</string>
-    <string name="create_empty">手动配置</string>
+    <string name="create_empty">手动创建</string>
     <string name="create_from_file">导入配置或压缩包</string>
     <string name="create_from_qr_code">扫描二维码</string>
     <string name="create_output_dir_error">无法创建输出目录</string>
@@ -63,12 +63,12 @@
     <string name="toggle_all">反选</string>
     <string name="dns_servers">DNS 服务器</string>
     <string name="edit">编辑</string>
-    <string name="endpoint">对端地址</string>
+    <string name="endpoint">对端</string>
     <string name="error_down">断开连接时出错：%s</string>
     <string name="error_fetching_apps">获取应用列表时出错：%s</string>
     <string name="error_root">请获取 root 权限并重试</string>
     <string name="error_up">建立连接时出错：%s</string>
-    <string name="exclude_private_ips">排除局域网 IP</string>
+    <string name="exclude_private_ips">排除局域网</string>
     <string name="excluded_applications">排除的应用</string>
     <string name="generate">生成密钥</string>
     <string name="generic_error">未知的 “%s” 错误</string>
@@ -92,24 +92,32 @@
     <string name="logcat_error">无法运行 logcat：</string>
     <string name="module_version_error">无法确定内核模块版本</string>
     <string name="module_installer_not_found">没有可用于此设备的模块</string>
-    <string name="module_installer_initial">此实验性的内核模块可以提升性能</string>
-    <string name="module_installer_success">安装成功，应用将在 5 秒后重启</string>
+    <string name="module_installer_initial">使用内核模块可以提升性能（实验性）</string>
+    <string name="module_installer_success">安装成功，应用将于 5 秒后重启</string>
     <string name="module_installer_title">下载并安装内核模块</string>
     <string name="module_installer_working">正在下载安装...</string>
     <string name="module_installer_error">发生错误，请重试</string>
+    <string name="module_disabler_disabled_title">启用内核模块</string>
+    <string name="module_disabler_disabled_summary">内核空间的模块性能较强，但可能不稳定</string>
+    <string name="module_disabler_enabled_title">停用内核模块</string>
+    <string name="module_disabler_enabled_summary">用户空间的模块性能较弱，但稳定性更好</string>
+    <string name="module_disabler_working">应用将于 5 秒后重启</string>
     <string name="mtu">MTU</string>
+    <string name="multiple_tunnels_title">同时开启多条隧道</string>
+    <string name="multiple_tunnels_summary_on">当前允许同时开启多条隧道</string>
+    <string name="multiple_tunnels_summary_off">当前一次只能开启一条隧道</string>
     <string name="name">名称</string>
     <string name="no_config_error">尝试在无配置情况下建立连接</string>
     <string name="no_configs_error">未找到配置</string>
     <string name="no_tunnels_error">无隧道</string>
     <string name="parse_error_generic">字符串</string>
-    <string name="parse_error_inet_address"> IP 地址</string>
-    <string name="parse_error_inet_endpoint">对端地址</string>
-    <string name="parse_error_inet_network"> IP 网络</string>
+    <string name="parse_error_inet_address">&#32;IP 地址</string>
+    <string name="parse_error_inet_endpoint">对端</string>
+    <string name="parse_error_inet_network">&#32;IP 网络</string>
     <string name="parse_error_integer">数字</string>
-    <string name="parse_error_reason">无法解析%1$s “%2$s” </string>
+    <string name="parse_error_reason">无法解析%1$s “%2$s”&#32;</string>
     <string name="peer">节点 / Peer</string>
-    <string name="permission_description">允许一个应用对 WireGuard 隧道进行控制（开启 / 关闭隧道），但可能会误传一些流量</string>
+    <string name="permission_description">允许其他应用控制 WireGuard 隧道（开启 / 关闭），但可能会误传一些流量</string>
     <string name="permission_label">控制 WireGuard 隧道</string>
     <string name="persistent_keepalive">连接保活间隔</string>
     <string name="pre_shared_key">预共享密钥</string>
@@ -117,7 +125,9 @@
     <string name="public_key">公钥</string>
     <string name="public_key_description">公钥</string>
     <string name="qr_code_hint">提示：使用命令 `qrencode -t ansiutf8 &lt; tunnel.conf` 生成二维码</string>
-    <string name="restore_on_boot_title">开机自启</string>
+    <string name="restore_on_boot_summary_on">设备启动时自动开启上次使用的隧道</string>
+    <string name="restore_on_boot_summary_off">未启用</string>
+    <string name="restore_on_boot_title">启动时恢复</string>
     <string name="save">保存</string>
     <string name="select_all">全选</string>
     <string name="set_exclusions">确定</string>
@@ -128,9 +138,9 @@
     <string name="toggle_error">切换隧道状态时出错：%s</string>
     <string name="tools_installer_already">wg 与 wg-quick 已安装</string>
     <string name="tools_installer_failure">无法安装命令行工具（尚未获取 root 权限？）</string>
-    <string name="tools_installer_initial">安装脚本工具（可选）</string>
-    <string name="tools_installer_initial_magisk">安装脚本工具为 Magisk 模块（可选）</string>
-    <string name="tools_installer_initial_system">安装脚本工具至系统分区（可选）</string>
+    <string name="tools_installer_initial">安装命令行工具（可选）</string>
+    <string name="tools_installer_initial_magisk">安装命令行工具为 Magisk 模块（可选）</string>
+    <string name="tools_installer_initial_system">安装命令行工具至系统分区（可选）</string>
     <string name="tools_installer_success_magisk">wg 与 wg-quick 已安装为 Magisk 模块（重启后生效）</string>
     <string name="tools_installer_success_system">wg 与 wg-quick 已安装至系统分区</string>
     <string name="tools_installer_title">安装命令行工具</string>
-- 
2.24.1.windows.2

