Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6C1C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 16:23:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 599E0650F3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 16:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 599E0650F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d4914b1;
	Sun, 7 Mar 2021 16:20:28 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9bb76a69
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 16:20:26 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b7so11071291edz.8
 for <wireguard@lists.zx2c4.com>; Sun, 07 Mar 2021 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dlse/4L2Bfn34RIgqsdVIbI+ed+YMzNd90h7t475ALo=;
 b=Dm/8MfiCSIIMaqkSTJbFc43JaleDHj+OltTdIr7GiCJfo2WNrJ9yKbDnoxX1Jflzma
 p1Dsw9TgscurMQFptfXHc6UMbJdySEsZrL8x1f24lqdAM/9luGbaQ8Lknmdtf+3hjL9v
 J41G6+vkGcwJJZu89Xh9Jevrn0b9Ah7+lAEbMDdO0vYTnSxZFc1qlFgK/Ax1Wvi3gjao
 T0Fzbc6VaGOr1BIwDWqcQqEhIsMbVJpKwcp0P0+/jeRdcWtmLt/aeV8XcBpmGwLSj/mX
 pCVbBHgpgrQ8V9liNXHOovIZaMzdp+wtpD4ZvpPa90NrXXY4x72pNcYumVPDrCOf/mX8
 u7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlse/4L2Bfn34RIgqsdVIbI+ed+YMzNd90h7t475ALo=;
 b=qVMQq7OqBv0Ob5Ei8mmvpDsjXkpiAOMWxHrXn5w+dfLOcyrxg89KzX1mQfHGKNTq9E
 K/x828tUewuw84tBcP9a6RBuZSKOHbGJGeHnHPkzeZ/k+3/tCvK8dCY+BnU0ZxorhXMt
 CZ8reAN3WcXvOg4hembUd+vmd+lDfpM9VoqZ5xYPO67BnphlITBY/5taycS5CqBe2CwN
 MZb3qXCNTNfDnqb/pfNs/Lgo0CrI7PVHPiQ8J/2VkWf29hBRqchg7HPiqYv1o/lxmjmi
 pkMPVwgO8rv1t0MONPeg3kQR4krPN4UH0AR/scIdP2CmoQrGTDG67syhGVzeroRt3evw
 jjEQ==
X-Gm-Message-State: AOAM531w3wPp1lgzDmRK0xbL2e6jI7zy/Hp5PDL4WYGg17tx2YdL3nZ9
 twggq5jf7Y1g17oeWCl01dtBSW8a9YQ=
X-Google-Smtp-Source: ABdhPJyetgFri76qVK/FkDR3DZMO9ouSfD6uBZOBc+VDxo9IxYd+Qt65IvDtmjZKiS7C1HWIf2VdAg==
X-Received: by 2002:aa7:d686:: with SMTP id d6mr18807498edr.146.1615134026080; 
 Sun, 07 Mar 2021 08:20:26 -0800 (PST)
Received: from kay-hp.lan ([79.140.120.198])
 by smtp.gmail.com with ESMTPSA id d19sm5594364edr.45.2021.03.07.08.20.25
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 08:20:25 -0800 (PST)
From: kayrus <kay.diam@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Windows: add convertInterfaceIndexToLUID syscall
Date: Sun,  7 Mar 2021 17:20:24 +0100
Message-Id: <20210307162024.1153144-1-kay.diam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306095820.1039294-1-kay.diam@gmail.com>
References: <20210306095820.1039294-1-kay.diam@gmail.com>
MIME-Version: 1.0
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

This change can be used to easily get an access to any interface by name, e.g.

iface, err := net.InterfaceByName(name)
if err ! nil {
	return err
}

luid, err := winipcfg.LUIDFromIndex(uint32(iface.Index))
if err != nil {
	return err
}

Signed-off-by: kayrus <kay.diam@gmail.com>
---
 tunnel/winipcfg/luid.go              | 11 +++++++++++
 tunnel/winipcfg/winipcfg.go          |  1 +
 tunnel/winipcfg/zwinipcfg_windows.go |  9 +++++++++
 3 files changed, 21 insertions(+)

diff --git a/tunnel/winipcfg/luid.go b/tunnel/winipcfg/luid.go
index efdf1ba4..02ba65b4 100644
--- a/tunnel/winipcfg/luid.go
+++ b/tunnel/winipcfg/luid.go
@@ -63,6 +63,17 @@ func LUIDFromGUID(guid *windows.GUID) (LUID, error) {
 	return luid, nil
 }
 
+// LUIDFromIndex function converts a local index for a network interface to the locally unique identifier (LUID) for the interface.
+// https://docs.microsoft.com/en-us/windows/desktop/api/netioapi/nf-netioapi-convertinterfaceindextoluid
+func LUIDFromIndex(index uint32) (LUID, error) {
+	var luid LUID
+	err := convertInterfaceIndexToLUID(index, &luid)
+	if err != nil {
+		return 0, err
+	}
+	return luid, nil
+}
+
 // IPAddress method returns MibUnicastIPAddressRow struct that matches to provided 'ip' argument. Corresponds to GetUnicastIpAddressEntry
 // (https://docs.microsoft.com/en-us/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddressentry)
 func (luid LUID) IPAddress(ip net.IP) (*MibUnicastIPAddressRow, error) {
diff --git a/tunnel/winipcfg/winipcfg.go b/tunnel/winipcfg/winipcfg.go
index 54040a1c..dd09d3a0 100644
--- a/tunnel/winipcfg/winipcfg.go
+++ b/tunnel/winipcfg/winipcfg.go
@@ -30,6 +30,7 @@ import (
 //sys	getIfTable2Ex(level MibIfEntryLevel, table **mibIfTable2) (ret error) = iphlpapi.GetIfTable2Ex
 //sys	convertInterfaceLUIDToGUID(interfaceLUID *LUID, interfaceGUID *windows.GUID) (ret error) = iphlpapi.ConvertInterfaceLuidToGuid
 //sys	convertInterfaceGUIDToLUID(interfaceGUID *windows.GUID, interfaceLUID *LUID) (ret error) = iphlpapi.ConvertInterfaceGuidToLuid
+//sys	convertInterfaceIndexToLUID(interfaceIndex uint32, interfaceLUID *LUID) (ret error) = iphlpapi.ConvertInterfaceIndexToLuid
 
 // GetAdaptersAddresses function retrieves the addresses associated with the adapters on the local computer.
 // https://docs.microsoft.com/en-us/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses
diff --git a/tunnel/winipcfg/zwinipcfg_windows.go b/tunnel/winipcfg/zwinipcfg_windows.go
index c4bf3b00..ac89fec1 100644
--- a/tunnel/winipcfg/zwinipcfg_windows.go
+++ b/tunnel/winipcfg/zwinipcfg_windows.go
@@ -42,6 +42,7 @@ var (
 
 	procCancelMibChangeNotify2          = modiphlpapi.NewProc("CancelMibChangeNotify2")
 	procConvertInterfaceGuidToLuid      = modiphlpapi.NewProc("ConvertInterfaceGuidToLuid")
+	procConvertInterfaceIndexToLuid     = modiphlpapi.NewProc("ConvertInterfaceIndexToLuid")
 	procConvertInterfaceLuidToGuid      = modiphlpapi.NewProc("ConvertInterfaceLuidToGuid")
 	procCreateAnycastIpAddressEntry     = modiphlpapi.NewProc("CreateAnycastIpAddressEntry")
 	procCreateIpForwardEntry2           = modiphlpapi.NewProc("CreateIpForwardEntry2")
@@ -88,6 +89,14 @@ func convertInterfaceGUIDToLUID(interfaceGUID *windows.GUID, interfaceLUID *LUID
 	return
 }
 
+func convertInterfaceIndexToLUID(interfaceIndex uint32, interfaceLUID *LUID) (ret error) {
+	r0, _, _ := syscall.Syscall(procConvertInterfaceIndexToLuid.Addr(), 2, uintptr(interfaceIndex), uintptr(unsafe.Pointer(interfaceLUID)), 0)
+	if r0 != 0 {
+		ret = syscall.Errno(r0)
+	}
+	return
+}
+
 func convertInterfaceLUIDToGUID(interfaceLUID *LUID, interfaceGUID *windows.GUID) (ret error) {
 	r0, _, _ := syscall.Syscall(procConvertInterfaceLuidToGuid.Addr(), 2, uintptr(unsafe.Pointer(interfaceLUID)), uintptr(unsafe.Pointer(interfaceGUID)), 0)
 	if r0 != 0 {
-- 
2.25.1

