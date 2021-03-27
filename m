Return-Path: <SRS0=AHPd=I4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E39C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Mar 2021 08:38:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037EA61987
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Mar 2021 08:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037EA61987
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c952b7c;
	Tue, 30 Mar 2021 08:38:21 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2048.outbound.protection.outlook.com [40.92.22.48])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id deeb40f8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Mar 2021 20:58:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i72MZfA/YtQZ+WnD3vSnflxnO2sLZ0fq4YEUC/YldhUwciDRRF6CGtwI5iAwmH0YeublZo0cEQJgC9Po9z2WkQiBVEx9wbjCcbQ6nLWfB3mYsHnW+e3qrfzSdiFrYPWWAS6ZewuuppC852ENDw1RnA4Q3hEyWOtErEvGrhEdU9HlG9GCM9M5AXuJwhnZnH0KF6M51XLryV20ObtZ6wnuJlMq8i/WDLKQeoYFMiOMxuMQEG+Wn59BVEP7h4m/kCXh+2WzZp49IvqLIkoYks5nPQr96sG/nTPREWJGk5G4WebdVMnAumWk2503wAZrDamlWfW1p8dn9b+eyEA4MS4yoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxaouxypdy7Wb3J+96osaRQSBf+D02CzH4YyrFiZ1ro=;
 b=Aa1hzaGXHHuCE0QIR3RJXKh9RcZRN5HCOIJ7cPmNapr8k2FRtL74ZgAafS5rkcSpkVXJSDbEdq8Uo1aV+mszQWhb2IXhT4E7JBge2ydo3q8PoGU0lX1jbh/xvVviZlLXtLX1/DPKIEjdaM/4cbUUp7/6UEtt6CkhDsnsmf8HLasKylfm9NObTlnqQGL+VG1YqqTNmhy74SoTWgkSUXOfE+qb4Mg7tBD6fEvPa7OqjUT/OJswn3ZmNfv2bX8L8geDtYX1k2NTL1pfsEv0EyvQAGi0utJNwXCjtihiGA24QfA9AxAsycXDCcDrBTDROmdnDFqKtAm6Pk214Z4R9dgf0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxaouxypdy7Wb3J+96osaRQSBf+D02CzH4YyrFiZ1ro=;
 b=JV24/C+Acik6B+m52cB2nEGWJvm3S/ywyJNjBKQSX82MbzX8oWPlt11mz+nkna6si+EW95p9bbwdCNNVbjCh86Ke8i+9ogLQUHaV+lbgfG8s5c9mpu46JC5AMRwSZvZNDXyHr14bWsbJLWoT1/LFFHbVMOZqg69+uNaMvmvGQ4dj05TsmTL/+h/BeNWb3+YJldqciHIBJTyT6dsqMApOFAdP2UZ97vGKwRtPJE3Mv4NPHZ85VVxrR7GykpJ4Nyo4WG7gTzXnVpHl9gQj9cus2DQR25zFjlpsf85JsWe6SNyFuxLcu4PZ2LEO4xx9y8hn220w3EUzWmxhknhvAXsuYw==
Received: from DM6PR13MB2457.namprd13.prod.outlook.com (2603:10b6:5:be::25) by
 DM6PR13MB3939.namprd13.prod.outlook.com (2603:10b6:5:2a8::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.16; Sat, 27 Mar 2021 20:58:37 +0000
Received: from DM6PR13MB2457.namprd13.prod.outlook.com
 ([fe80::515:c9f0:8d58:1bdd]) by DM6PR13MB2457.namprd13.prod.outlook.com
 ([fe80::515:c9f0:8d58:1bdd%5]) with mapi id 15.20.3977.017; Sat, 27 Mar 2021
 20:58:37 +0000
From: Adam Irr <adam.irr@outlook.com>
Subject: [PATCH] wg-quick: Android: Add up/down hook support
To: wireguard@lists.zx2c4.com
Message-ID: <DM6PR13MB24579CD788EF28E019933C0A92609@DM6PR13MB2457.namprd13.prod.outlook.com>
Date: Sat, 27 Mar 2021 13:58:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Type: multipart/mixed; boundary="------------DD14B2F106492C3D9CB70745"
Content-Language: en-US
X-TMN: [kpPapTOqwRdmFygZh6W315SwhKtxqw+cF4BdwxzcIizw2VKfHyzeIJEJI2PhRUu7]
X-ClientProxiedBy: CO2PR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:104:1::18) To DM6PR13MB2457.namprd13.prod.outlook.com
 (2603:10b6:5:be::25)
X-Microsoft-Original-Message-ID: <0a83f0f7-7af1-c6b6-f440-94787a7d8394@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:602:847f:83a6:9b5b:5ce3:2e04:a68f]
 (2601:602:847f:83a6:9b5b:5ce3:2e04:a68f) by
 CO2PR05CA0092.namprd05.prod.outlook.com (2603:10b6:104:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.15 via Frontend Transport; Sat, 27 Mar 2021 20:58:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e3cd0f7-6d59-4b4b-343d-08d8f1631758
X-MS-TrafficTypeDiagnostic: DM6PR13MB3939:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MMxEM+KMNQnBxh6A7VZpUKMzwPFuqVn+ot2LEpC4CKau118ugAZVqLhagKD2UiIFBAlycuFnMh20CTkF8R4qBiemxBvR/E8EuWehKTZs/UqzAAy3igjn2+YyDZASeGeT0E7U5moqOW4PR9j6j6GoIKGSB3HoHFY3vhGn69Hf47x1m2/MQOzM4+W3ULT0Gq0c99oaXqOxIAYK0dYQAaudQGJ4k7oeY11+ue+7BuZPlTCkLGbCFE60aGMkPdBZ+5j4Cw7W1JgxVArejS/Gt8C2Mvov3YHzOmTdFzk8Jp2jcow5N7LEB4za5NcsloQHXaAOwugfAtvB6zD1Ej8qvgLWvjX3/T6vUXrVyVKPOgH/r8oV6iOubQKpEoMDohALDhZXp2ir0Zc3HrVF20pVf65Ds3HGlH1Pjf4h4A374g2ieMioK2hRZBOL6h4FPTKLDwGk
X-MS-Exchange-AntiSpam-MessageData: wePNcs4bdkFJDXizwRvA9wqCy10nHNHcsaPeKkqX84TkMekcFNCXMicHbixGRDesogYZfDzjxlxI1h3twsnJLyq9yDEtj7iMmqcEIuasDxbH0cwtZwg5mNcDkcISFc9AMb9eo2R1UpHmk6Uo+6ll5TCx2qTGpaa+AUqJMTHAElykAUcZ0meEOM59koGZRnRLtCHhLJUp/IRpCWOCWMnC8w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3cd0f7-6d59-4b4b-343d-08d8f1631758
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB2457.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2021 20:58:37.2825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB3939
X-Mailman-Approved-At: Tue, 30 Mar 2021 08:38:17 +0000
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

--------------DD14B2F106492C3D9CB70745
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I have been using my Nvidia Shield with a self-built kernel module as a 
Wireguard server with the support of this patch to have access to my 
home network. There is a corresponding change needed in the Android 
app[1] to make this work. I am not super familiar with C so please take 
time to scrutinize this code - particularly the memory management. If 
its easier to provide feedback on a Github pull request, let me know and 
I can open one.

[1] https://github.com/WireGuard/wireguard-android/pull/23

Thank you,

Adam

-----

From 77e9153510fbcacafe20b2813ca11464768f1fd0 Mon Sep 17 00:00:00 2001
From: Adam Irr <adam.irr@outlook.com>
Date: Sat, 27 Mar 2021 13:47:09 -0700
Subject: [PATCH] wg-quick: Android: Add up/down hook support

This change allows Pre/Post Up/Down commands to be run
for Android devices. This provides a mechanism for Android
devices to behave like a server and automatically set up
routing rules.

Signed-off-by: Adam Irr <adam.irr@outlook.com>
---
  src/wg-quick/android.c | 91 ++++++++++++++++++++++++++++++++++++++----
  1 file changed, 84 insertions(+), 7 deletions(-)

diff --git a/src/wg-quick/android.c b/src/wg-quick/android.c
index 941c7b8..7d3cd03 100644
--- a/src/wg-quick/android.c
+++ b/src/wg-quick/android.c
@@ -1097,6 +1097,9 @@ static void cmd_usage(const char *program)
          "  - DNS: an optional DNS server to use while the device is up.\n"
          "  - ExcludedApplications: optional blacklist of applications 
to exclude from the tunnel.\n\n"
          "  - IncludedApplications: optional whitelist of applications 
to include in the tunnel.\n\n"
+        "  - PreUp, PostUp, PreDown, PostDown: script snippets which 
will be executed\n"
+        "    by a root shell at the corresponding phases of the link.\n"
+        "    The string \\`%i' is expanded to INTERFACE."
          "  See wg-quick(8) for more info and examples.\n");
  }

@@ -1110,7 +1113,39 @@ static void cmd_up_cleanup(void)
      free(cleanup_iface);
  }

-static void cmd_up(const char *iface, const char *config, unsigned int 
mtu, const char *addrs, const char *dnses, const char 
*excluded_applications, const char *included_applications)
+static void run_hooks(const char *cmds, const char *iface)
+{
+    if (cmds == NULL)
+        return;
+    size_t len = strlen(cmds), iface_len = strlen(iface), j = 0, 
iface_count = 0;
+    if (len > (1<<16))
+        return;
+    for (size_t i = 0; i < len - 1; ++i) {
+        if (cmds[i] == '%' && cmds[++i] == 'i') {
+            iface_count++;
+        }
+    }
+
+    // Allocate enough space for the full command after replacing %i 
with the interface name
+    _cleanup_free_ char *current_cmd = xmalloc(len + ((iface_len - 2) * 
iface_count) + 1);
+
+    for (size_t i = 0; i < len; ++i) {
+        if (cmds[i] != '\n') {
+            if (cmds[i] == '%' && cmds[++i] == 'i') {
+                strcpy(current_cmd + j, iface);
+                j += iface_len;
+            } else {
+                current_cmd[j++] = cmds[i];
+            }
+        } else if (j != 0) {
+            current_cmd[j] = '\0';
+            j = 0;
+            cmd("%s", current_cmd);
+        }
+    }
+}
+
+static void cmd_up(const char *iface, const char *config, unsigned int 
mtu, const char *addrs, const char *dnses, const char 
*excluded_applications, const char *included_applications, const char 
*pre_up_cmds, const char *post_up_cmds)
  {
      DEFINE_CMD(c);
      unsigned int netid = 0;
@@ -1127,7 +1162,9 @@ static void cmd_up(const char *iface, const char 
*config, unsigned int mtu, cons
      add_if(iface);
      set_config(iface, config);
      listen_port = determine_listen_port(iface);
+    run_hooks(pre_up_cmds, iface);
      up_if(&netid, iface, listen_port);
+    run_hooks(post_up_cmds, iface);
      set_addr(iface, addrs);
      set_dnses(netid, dnses);
      set_routes(iface, netid);
@@ -1140,7 +1177,7 @@ static void cmd_up(const char *iface, const char 
*config, unsigned int mtu, cons
      exit(EXIT_SUCCESS);
  }

-static void cmd_down(const char *iface)
+static void cmd_down(const char *iface, char *pre_down_cmds, char 
*post_down_cmds)
  {
      DEFINE_CMD(c);
      bool found = false;
@@ -1159,12 +1196,32 @@ static void cmd_down(const char *iface)
          exit(EMEDIUMTYPE);
      }

+    run_hooks(pre_down_cmds, iface);
      del_if(iface);
+    run_hooks(post_down_cmds, iface);
      broadcast_change();
      exit(EXIT_SUCCESS);
  }

-static void parse_options(char **iface, char **config, unsigned int 
*mtu, char **addrs, char **dnses, char **excluded_applications, char 
**included_applications, const char *arg)
+static void clean_hook_cmd(const char *line, const size_t len, char 
*output)
+{
+    size_t j = 0;
+    bool found_prefix = false;
+    bool found_cmd_start = false;
+    for (size_t i = 0; i < len; ++i) {
+        if (!found_cmd_start && isspace(line[i]))
+            continue;
+        if (found_prefix && !isspace(line[i]))
+            found_cmd_start = true;
+        if (line[i] == '=')
+            found_prefix = true;
+
+        output[j++] = line[i];
+    }
+    output[j] = '\0';
+}
+
+static void parse_options(char **iface, char **config, unsigned int 
*mtu, char **addrs, char **dnses, char **excluded_applications, char 
**included_applications, char **pre_up_cmds, char **post_up_cmds, char 
**pre_down_cmds, char **post_down_cmds, const char *arg)
  {
      _cleanup_fclose_ FILE *file = NULL;
      _cleanup_free_ char *line = NULL;
@@ -1254,6 +1311,22 @@ static void parse_options(char **iface, char 
**config, unsigned int *mtu, char *
              } else if (!strncasecmp(clean, "MTU=", 4) && j > 4) {
                  *mtu = atoi(clean + 4);
                  continue;
+            } else if (!strncasecmp(clean, "PreUp=", 6) && j > 4) {
+                clean_hook_cmd(line, len, clean);
+                *pre_up_cmds = concat_and_free(*pre_up_cmds, "\n", 
clean + 6);
+                continue;
+            } else if (!strncasecmp(clean, "PostUp=", 7) && j > 4) {
+                clean_hook_cmd(line, len, clean);
+                *post_up_cmds = concat_and_free(*post_up_cmds, "\n", 
clean + 7);
+                continue;
+            } else if (!strncasecmp(clean, "PreDown=", 8) && j > 4) {
+                clean_hook_cmd(line, len, clean);
+                *pre_down_cmds = concat_and_free(*pre_down_cmds, "\n", 
clean + 8);
+                continue;
+            } else if (!strncasecmp(clean, "PostDown=", 9) && j > 4) {
+                clean_hook_cmd(line, len, clean);
+                *post_down_cmds = concat_and_free(*post_down_cmds, 
"\n", clean + 9);
+                continue;
              }
          }
          *config = concat_and_free(*config, "", line);
@@ -1278,17 +1351,21 @@ int main(int argc, char *argv[])
      _cleanup_free_ char *excluded_applications = NULL;
      _cleanup_free_ char *included_applications = NULL;
      unsigned int mtu;
+    _cleanup_free_ char *pre_up_cmds = NULL;
+    _cleanup_free_ char *post_up_cmds = NULL;
+    _cleanup_free_ char *pre_down_cmds = NULL;
+    _cleanup_free_ char *post_down_cmds = NULL;

      if (argc == 2 && (!strcmp(argv[1], "help") || !strcmp(argv[1], 
"--help") || !strcmp(argv[1], "-h")))
          cmd_usage(argv[0]);
      else if (argc == 3 && !strcmp(argv[1], "up")) {
          auto_su(argc, argv);
-        parse_options(&iface, &config, &mtu, &addrs, &dnses, 
&excluded_applications, &included_applications, argv[2]);
-        cmd_up(iface, config, mtu, addrs, dnses, excluded_applications, 
included_applications);
+        parse_options(&iface, &config, &mtu, &addrs, &dnses, 
&excluded_applications, &included_applications, &pre_up_cmds, 
&post_up_cmds, &pre_down_cmds, &post_down_cmds, argv[2]);
+        cmd_up(iface, config, mtu, addrs, dnses, excluded_applications, 
included_applications, pre_up_cmds, post_up_cmds);
      } else if (argc == 3 && !strcmp(argv[1], "down")) {
          auto_su(argc, argv);
-        parse_options(&iface, &config, &mtu, &addrs, &dnses, 
&excluded_applications, &included_applications, argv[2]);
-        cmd_down(iface);
+        parse_options(&iface, &config, &mtu, &addrs, &dnses, 
&excluded_applications, &included_applications, &pre_up_cmds, 
&post_up_cmds, &pre_down_cmds, &post_down_cmds, argv[2]);
+        cmd_down(iface, pre_down_cmds, post_down_cmds);
      } else {
          cmd_usage(argv[0]);
          return 1;
-- 
2.25.1



--------------DD14B2F106492C3D9CB70745
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-wg-quick-Android-Add-up-down-hook-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-wg-quick-Android-Add-up-down-hook-support.patch"

From 77e9153510fbcacafe20b2813ca11464768f1fd0 Mon Sep 17 00:00:00 2001
From: Adam Irr <adam.irr@outlook.com>
Date: Sat, 27 Mar 2021 13:47:09 -0700
Subject: [PATCH] wg-quick: Android: Add up/down hook support

This change allows Pre/Post Up/Down commands to be run
for Android devices. This provides a mechanism for Android
devices to behave like a server and automatically set up
routing rules.

Signed-off-by: Adam Irr <adam.irr@outlook.com>
---
 src/wg-quick/android.c | 91 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 7 deletions(-)

diff --git a/src/wg-quick/android.c b/src/wg-quick/android.c
index 941c7b8..7d3cd03 100644
--- a/src/wg-quick/android.c
+++ b/src/wg-quick/android.c
@@ -1097,6 +1097,9 @@ static void cmd_usage(const char *program)
 		"  - DNS: an optional DNS server to use while the device is up.\n"
 		"  - ExcludedApplications: optional blacklist of applications to exclude from the tunnel.\n\n"
 		"  - IncludedApplications: optional whitelist of applications to include in the tunnel.\n\n"
+		"  - PreUp, PostUp, PreDown, PostDown: script snippets which will be executed\n"
+		"    by a root shell at the corresponding phases of the link.\n"
+		"    The string \\`%i' is expanded to INTERFACE."
 		"  See wg-quick(8) for more info and examples.\n");
 }
 
@@ -1110,7 +1113,39 @@ static void cmd_up_cleanup(void)
 	free(cleanup_iface);
 }
 
-static void cmd_up(const char *iface, const char *config, unsigned int mtu, const char *addrs, const char *dnses, const char *excluded_applications, const char *included_applications)
+static void run_hooks(const char *cmds, const char *iface)
+{
+	if (cmds == NULL)
+		return;
+	size_t len = strlen(cmds), iface_len = strlen(iface), j = 0, iface_count = 0;
+	if (len > (1<<16))
+		return;
+	for (size_t i = 0; i < len - 1; ++i) {
+		if (cmds[i] == '%' && cmds[++i] == 'i') {
+			iface_count++;
+		}
+	}
+
+	// Allocate enough space for the full command after replacing %i with the interface name
+	_cleanup_free_ char *current_cmd = xmalloc(len + ((iface_len - 2) * iface_count) + 1);
+
+	for (size_t i = 0; i < len; ++i) {
+		if (cmds[i] != '\n') {
+			if (cmds[i] == '%' && cmds[++i] == 'i') {
+				strcpy(current_cmd + j, iface);
+				j += iface_len;
+			} else {
+				current_cmd[j++] = cmds[i];
+			}
+		} else if (j != 0) {
+			current_cmd[j] = '\0';
+			j = 0;
+			cmd("%s", current_cmd);
+		}
+	}
+}
+
+static void cmd_up(const char *iface, const char *config, unsigned int mtu, const char *addrs, const char *dnses, const char *excluded_applications, const char *included_applications, const char *pre_up_cmds, const char *post_up_cmds)
 {
 	DEFINE_CMD(c);
 	unsigned int netid = 0;
@@ -1127,7 +1162,9 @@ static void cmd_up(const char *iface, const char *config, unsigned int mtu, cons
 	add_if(iface);
 	set_config(iface, config);
 	listen_port = determine_listen_port(iface);
+	run_hooks(pre_up_cmds, iface);
 	up_if(&netid, iface, listen_port);
+	run_hooks(post_up_cmds, iface);
 	set_addr(iface, addrs);
 	set_dnses(netid, dnses);
 	set_routes(iface, netid);
@@ -1140,7 +1177,7 @@ static void cmd_up(const char *iface, const char *config, unsigned int mtu, cons
 	exit(EXIT_SUCCESS);
 }
 
-static void cmd_down(const char *iface)
+static void cmd_down(const char *iface, char *pre_down_cmds, char *post_down_cmds)
 {
 	DEFINE_CMD(c);
 	bool found = false;
@@ -1159,12 +1196,32 @@ static void cmd_down(const char *iface)
 		exit(EMEDIUMTYPE);
 	}
 
+	run_hooks(pre_down_cmds, iface);
 	del_if(iface);
+	run_hooks(post_down_cmds, iface);
 	broadcast_change();
 	exit(EXIT_SUCCESS);
 }
 
-static void parse_options(char **iface, char **config, unsigned int *mtu, char **addrs, char **dnses, char **excluded_applications, char **included_applications, const char *arg)
+static void clean_hook_cmd(const char *line, const size_t len, char *output)
+{
+    size_t j = 0;
+    bool found_prefix = false;
+    bool found_cmd_start = false;
+    for (size_t i = 0; i < len; ++i) {
+        if (!found_cmd_start && isspace(line[i]))
+            continue;
+        if (found_prefix && !isspace(line[i]))
+            found_cmd_start = true;
+        if (line[i] == '=')
+            found_prefix = true;
+
+        output[j++] = line[i];
+    }
+    output[j] = '\0';
+}
+
+static void parse_options(char **iface, char **config, unsigned int *mtu, char **addrs, char **dnses, char **excluded_applications, char **included_applications, char **pre_up_cmds, char **post_up_cmds, char **pre_down_cmds, char **post_down_cmds, const char *arg)
 {
 	_cleanup_fclose_ FILE *file = NULL;
 	_cleanup_free_ char *line = NULL;
@@ -1254,6 +1311,22 @@ static void parse_options(char **iface, char **config, unsigned int *mtu, char *
 			} else if (!strncasecmp(clean, "MTU=", 4) && j > 4) {
 				*mtu = atoi(clean + 4);
 				continue;
+			} else if (!strncasecmp(clean, "PreUp=", 6) && j > 4) {
+				clean_hook_cmd(line, len, clean);
+				*pre_up_cmds = concat_and_free(*pre_up_cmds, "\n", clean + 6);
+				continue;
+			} else if (!strncasecmp(clean, "PostUp=", 7) && j > 4) {
+				clean_hook_cmd(line, len, clean);
+				*post_up_cmds = concat_and_free(*post_up_cmds, "\n", clean + 7);
+				continue;
+			} else if (!strncasecmp(clean, "PreDown=", 8) && j > 4) {
+				clean_hook_cmd(line, len, clean);
+				*pre_down_cmds = concat_and_free(*pre_down_cmds, "\n", clean + 8);
+				continue;
+			} else if (!strncasecmp(clean, "PostDown=", 9) && j > 4) {
+				clean_hook_cmd(line, len, clean);
+				*post_down_cmds = concat_and_free(*post_down_cmds, "\n", clean + 9);
+				continue;
 			}
 		}
 		*config = concat_and_free(*config, "", line);
@@ -1278,17 +1351,21 @@ int main(int argc, char *argv[])
 	_cleanup_free_ char *excluded_applications = NULL;
 	_cleanup_free_ char *included_applications = NULL;
 	unsigned int mtu;
+	_cleanup_free_ char *pre_up_cmds = NULL;
+	_cleanup_free_ char *post_up_cmds = NULL;
+	_cleanup_free_ char *pre_down_cmds = NULL;
+	_cleanup_free_ char *post_down_cmds = NULL;
 
 	if (argc == 2 && (!strcmp(argv[1], "help") || !strcmp(argv[1], "--help") || !strcmp(argv[1], "-h")))
 		cmd_usage(argv[0]);
 	else if (argc == 3 && !strcmp(argv[1], "up")) {
 		auto_su(argc, argv);
-		parse_options(&iface, &config, &mtu, &addrs, &dnses, &excluded_applications, &included_applications, argv[2]);
-		cmd_up(iface, config, mtu, addrs, dnses, excluded_applications, included_applications);
+		parse_options(&iface, &config, &mtu, &addrs, &dnses, &excluded_applications, &included_applications, &pre_up_cmds, &post_up_cmds, &pre_down_cmds, &post_down_cmds, argv[2]);
+		cmd_up(iface, config, mtu, addrs, dnses, excluded_applications, included_applications, pre_up_cmds, post_up_cmds);
 	} else if (argc == 3 && !strcmp(argv[1], "down")) {
 		auto_su(argc, argv);
-		parse_options(&iface, &config, &mtu, &addrs, &dnses, &excluded_applications, &included_applications, argv[2]);
-		cmd_down(iface);
+		parse_options(&iface, &config, &mtu, &addrs, &dnses, &excluded_applications, &included_applications, &pre_up_cmds, &post_up_cmds, &pre_down_cmds, &post_down_cmds, argv[2]);
+		cmd_down(iface, pre_down_cmds, post_down_cmds);
 	} else {
 		cmd_usage(argv[0]);
 		return 1;
-- 
2.25.1


--------------DD14B2F106492C3D9CB70745--
