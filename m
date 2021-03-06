Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58655C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:46:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F99065004
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F99065004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f300be5;
	Sun, 7 Mar 2021 15:43:38 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 63aa7687
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Mar 2021 10:00:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b13so6435124edx.1
 for <wireguard@lists.zx2c4.com>; Sat, 06 Mar 2021 02:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4WTxp0n2bQvr6g6DXg2xji0YbFuxGa69lROiN10F+JQ=;
 b=HyELO4uQJAiRME4J1HB44hZ9YTGjVUc9BKWqS3sMRNs2RFf7jqmTEOxgkJGdrWIBXD
 IG4w/FTwzFttZ8oUyPMdUzQd8cRaf3N6U20UM26OKZXOGRRzlCCEuIidCld1kAkV8wK5
 QwmmI4HF/gqpfC0WaERHutPcuDBhcBv03+fRvIQIOlVxtDwFN0simwdh5gx+xpR+Kltv
 LG3DX0lyOwA1s9ceHoehZKJ/hVIfdiwVokVCn6Jy3LFmYesMYy0oNWgWb8LkXWDvh8xK
 nUoRwcv1KNDq8N3dXltTmeO9N1a8cMn6lNkMPSJGxU+SagHRjJGVaPwsWEkaQD6zxm+N
 4q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4WTxp0n2bQvr6g6DXg2xji0YbFuxGa69lROiN10F+JQ=;
 b=jUv/XD8JqOKyLyW/feEOunZ93737Wjj5XzXzIEKZrYGnIMOpLq3SR0mhZozm6T/960
 N+KsEfDn8MLCa/HhdNwjl1TOItd99e1qAzMIsm6mZ/jFxPaCV1g5eS2UR/UuVjKPxn83
 DCVs2YQslan9NyvAn/gSKELnrJ0aF44UhLcT1ZCZlu+sWtWMsWAPkEJ656VIgygFFIBq
 jyt+CbkW6f7rDFtdiwydgr62FRoO0ZNmp9cInJwDJIpJKpSw9axw+3uE+5VC7uIypvwS
 xIrqo7X9S6XzFpl4yGFCEFeGzW5NWrXZ53oCWuylOXPpLrUM43jpjn/C8mooONI3YipL
 WxKA==
X-Gm-Message-State: AOAM531HJNS1Iwlwq7/57wgHLLaWcGv9SAjFbR9LgLAm9qYCkCKoqfrT
 AY4JdbPi4htM8CGItNRs0l3n0hnt8OE=
X-Google-Smtp-Source: ABdhPJwyfwNd4fh7bWP0yOSiivp/rwW7Ni2iR13+Jy/6XrNW6aJFImRhQIq/Mn2EhbLa72pLknAwMA==
X-Received: by 2002:aa7:db01:: with SMTP id t1mr13218126eds.77.1615024854884; 
 Sat, 06 Mar 2021 02:00:54 -0800 (PST)
Received: from kay-hp.lan ([79.140.115.19])
 by smtp.gmail.com with ESMTPSA id 35sm3307567edp.85.2021.03.06.02.00.54
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:00:54 -0800 (PST)
From: kayrus <kay.diam@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Windows: add convertInterfaceIndexToLUID syscall
Date: Sat,  6 Mar 2021 11:00:53 +0100
Message-Id: <20210306100053.1039719-1-kay.diam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 07 Mar 2021 15:43:28 +0000
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

