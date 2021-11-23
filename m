Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AED7C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Nov 2021 10:14:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 750c53f9;
	Tue, 23 Nov 2021 10:14:30 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 11f89867
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Nov 2021 10:14:29 +0000 (UTC)
Received: from [192.168.0.31] ([95.222.31.133]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N32y5-1mdWW13iYP-013NAr for <wireguard@lists.zx2c4.com>; Tue, 23 Nov 2021
 11:14:28 +0100
From: Max Schulze <max.schulze@online.de>
Subject: Re: [PATCH v2] wireguard-tools: contrib/reresolve-dns script for
 Windows Powershell
To: wireguard@lists.zx2c4.com
References: <68de8cb8-81ce-1f51-22fd-9ef20b24f693@online.de>
Message-ID: <a0506608-2797-7bc2-8786-97678d01832a@online.de>
Date: Tue, 23 Nov 2021 11:14:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <68de8cb8-81ce-1f51-22fd-9ef20b24f693@online.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kTqTnRo+ybGXzHFeNEDhxeRBBB3BB+Yfo//wpF8peBDBkOn3Sv5
 nUA2SZVcOmX2kHtN9yjfQC4AEQXgluqGD7oQLpU/dGVeX2UHpSDe6ifz/WCOc5h3TYCmWyR
 2K2uxBPsaEX/5zHdyT8397BKaczVNf9dvBcbYidIn36XOOD79wuh18/krfSZfZAEX9RQQ7U
 r0nYM65DbJoE1D9QaIpcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s/PGOWJmN7w=:pXt0gyYwZOkv6pi7mfYhBx
 +r9YmKRuTOpWyWI7mH/fTCY8f15PX61t6HkpuY/F9SMdkMcAXX42zXd3ncwr9m6yCVYpJBCJm
 lkUzugDsfnSPSatfeWInZrbRdMwAdymdlhJuAI9H18ls677cdbxbnox6yLdgzPdNmAuY3sniy
 fgx581F3nWkY1D45q3GAtHGjrNYr0cviUIm9licjfIidB4pmWSTF+c1Fxwv7gxmg1+6JsMwAO
 EPJSv4Jk+bPywB1/dxConJqw+wOcVjERUIjoyYP7umDwFsH9O1r1O3kd8HK9l/nnXXBZEZzdQ
 u3D4ICWYbfuHOf5oXIi5IFWLxZFoVjC1inhaQj60rgr99m2GDmfuiZauqAsu4xthFWjnBvgs5
 Jk4DxZR46zBF2TB8qIeCKfe5HgJXTeqW0twysqviKrILodIz8ejH1pjbTiaflh1tQAN6iAxmV
 z+YEnyFdsYBbZbJ0A4AojD7BPdIdXzBA28IN9ehfYBGfR9+tfG1c8BEwH1fjSKMh3nOQvsEVJ
 p899AwTIPve0oKGhTc6pJqOOgAukKVtq64NrEq9hWcxeXpiN4kLlNBYSOKsplmeIpLhfY+nsl
 J2JPTJFjZdzot7u0p+qAp20Imh4frxPUF9Ts4jYxHsV9aB2va0DmbdrLRrhukgSY+tmE1ebQ7
 W+JywRLp22RheTUmMxZDLgktzmosaUifjansItDQJbJVkLh/19U4rglVB+R9+A1Bpfno0ncot
 CeTbNoVUiGyiXh0r
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

v2: Resend as-is, patch got garbled by thunderbird -.-

This is a script I use on windows for dynamic DNS endpoints ("servers").

The big upside is that it supports multiple configurations and does not need hard-coded endpoints or "ping-endpoints".

I would like to apply to get it included into wireguard-tools.

I have tested this in win7 and win10. You might add it to the task scheduler and run this every 3 minutes or so.

Some care has to be taken as to know which user is running the script. The encrypted dpapi-binary file can only be read by the same user that created/saved the tunnels, i.e. \system.

To make it easy to maintain this patch, I have tried to stick it as close to the linux version as possible. Jason, feel free to modify the copyright header as appropriate.

I am in no way the powershell guru, this is more trial-and-error.


NB: Why the limit to 15 chars in the Interface name? Mine had more, thus setting the arbitrary (?) limit to 18 chars.


Signed-off-by: Max Schulze <max.schulze@online.de>
---
 contrib/reresolve-dns/reresolve-dns.ps1 | 57 +++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 contrib/reresolve-dns/reresolve-dns.ps1

diff --git a/contrib/reresolve-dns/reresolve-dns.ps1 b/contrib/reresolve-dns/reresolve-dns.ps1
new file mode 100644
index 0000000..951eb33
--- /dev/null
+++ b/contrib/reresolve-dns/reresolve-dns.ps1
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) 2021 Max Schulze. All Rights Reserved.
+# near-literal Translation of the linux version by Jason A. Donenfeld
+
+# to decrypt the dpapi Credentials, you have to be the same user as the wireguard tunnel service, i.e. "nt authority\system", check with "whoami"
+# this script might be called by task scheduler as 
+#  powershell -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass -Command "Get-ChildItem -File 'c:\program Files\wireguard\data\configurations\*.dpapi'  | foreach {& C:\<path to script>\wireguard_reresolve-dns.ps1 $_.FullName}"
+# if you want to try it in cmd, remember to elevate the user, i.e. with psexec from sysutils
+#  psexec -s -i powershell -NoPr...
+
+Set-StrictMode -Version 3
+Add-Type -AssemblyName System.Security
+
+Set-Variable CONFIG_FILE -Value $args[0].ToString().Trim('"')
+
+$byteCrypted = ((Get-Content -LiteralPath $CONFIG_FILE -Encoding Byte -ReadCount 0))
+
+$config = [System.Security.Cryptography.ProtectedData]::Unprotect($byteCrypted,$null,[System.Security.Cryptography.DataProtectionScope]::LocalMachine)
+
+$config = [System.Text.UTF8Encoding]::UTF8.GetString($config)
+
+Set-Variable Interface -Option Constant -Value $(if ($CONFIG_FILE -match '.?([a-zA-Z0-9_=+.-]{1,18})\.conf.dpapi$') { $matches[1] } else { $null })
+
+function process_peer () {
+  if (-not $PEER_SECTION -or ($PUBLIC_KEY -eq $null) -or ($ENDPOINT -eq $null)) { return }
+  if (-not ((& wg show "$INTERFACE" latest-handshakes) -replace $PUBLIC_KEY -match ('[0-9]+'))) { return }
+  if (((Get-Date) - (New-Object -Type DateTime -ArgumentList 1970,1,1,0,0,0,0).AddSeconds($matches[0]).ToLocalTime()).TotalSeconds -le 135) { return }
+  (& wg set "$INTERFACE" peer "$PUBLIC_KEY" endpoint "$ENDPOINT")
+  reset_peer_section
+}
+
+function reset_peer_section () {
+  Set-Variable PEER_SECTION -Value $null
+  Set-Variable PUBLIC_KEY -Value $null
+  Set-Variable ENDPOINT -Value $null
+}
+
+reset_peer_section
+Set-Variable PEER_SECTION -Value $null
+
+foreach ($line in $config.Split([Environment]::NewLine,[StringSplitOptions]::RemoveEmptyEntries)) {
+  if ($line.Trim().length -gt 0) {
+    $stripped = $line.Trim() -ireplace '\#.*'
+    $key = $stripped -ireplace '=.*'; $key = $key.Trim()
+    $val = $stripped -ireplace '^.*?='; $val = $val.Trim()
+    if ($key -match '\[.*') { process_peer; reset_peer_section; }
+    if ($key -eq '[Peer]') { $PEER_SECTION = $true }
+    if ($PEER_SECTION) {
+      switch ($key) {
+        "PublicKey" { $PUBLIC_KEY = $val; continue; }
+        "Endpoint" { $ENDPOINT = $val; continue; }
+      }
+    }
+  }
+}
+process_peer
-- 
2.33.1

