Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73285C4828F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Feb 2024 21:04:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 640fb034;
	Thu, 8 Feb 2024 21:04:26 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9dbef46c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Feb 2024 21:04:23 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6048e351290so6506207b3.1
 for <wireguard@lists.zx2c4.com>; Thu, 08 Feb 2024 13:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707426262; x=1708031062; darn=lists.zx2c4.com;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dJ3QfbfoO9L8ty2grfpDO+7OYjOD4EvTkUa4QnpDYpg=;
 b=QMHywLWmpx9RQliqXjWd9vzQvm1bdmlPG0mrHxIRGPIlDEu4XN/Fz4Qv6qJ45bNE66
 Q4tjM8kezWmYuYyRN8IV6/gJ0NyQHLfDQwXK2cWwpYxqG9oU8NPBVF1PuDUUsykHdL0H
 3sc7SthGEou9dtaUB5JMnRhAXHrk3lCsxxVvvNsrbDrkhuH38wF+ra3cWjtnXn+RnQJe
 czRJYmbqNilDis8teXM8RxxD6CfCoqgV5gYy4s5cQRzICWIzlMfmgmSnTFOm7/QmkD1s
 tfZyVpHGUuv601ujsYCE4MiWDMHifnaPTeB7iEPD5kG/REccZg/3779w3AY4gjpId5eB
 EBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707426262; x=1708031062;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dJ3QfbfoO9L8ty2grfpDO+7OYjOD4EvTkUa4QnpDYpg=;
 b=Fjc76cg4aYQpmdm/jSncH00GqM+CMyCEHfW4FR4manbMGvFoAilDh+JW6kBOdC7cNv
 KxLyNTAjIMXAHao2doeuGV/22mHnw5wolFKiPV4Nn4YtBE1vlKIWDcoWkv/iuiovkp8w
 KX+K0K2JH/lKPkIpPXo7tY8GGekeGPbsw8s7Q2aDa4jRvpAE/NSENUmNza7okPVpL/CF
 xnxPMyukQO5AsaA5L9dTApV2N3LZ49wN40kY0WCLdSxBtqQ/O81XLDn+GUO8K7JyQcmQ
 J7pJnbE2hehUfGgZqW+Bel0klEjqFpwKFlAIw7Jky7RA80iIrDNzJqjOH3J5n4bQ/+lr
 GpdA==
X-Gm-Message-State: AOJu0Yy/zpBLL5JKjgJfiMgZPmwiG8r1GPChTaBeZxO0iu3ZdZOmzwe1
 LMBuUijrMRzUIaj+EfeQCjo+/61bd3H2R5if0BNf2h2/Emnr+ihsqCvm1FgePhuTUfXfqkL7RT1
 Uj4D8mFiVzSRJm/jEdbNKinhe4uTiRio/7cWePf8PXlwF152LmitGMSHAeQV2Mxhunxy7DBQ0q+
 PwDv7c3EpP2RWIDExvsD1xF4r6E3NhIRI=
X-Google-Smtp-Source: AGHT+IEGAWxykDGJSdVLu/+QVB3viCqhw1Idx010QlXwLp54Q2fs9/evQ7AySQgwPC+OB2nrP8J3h/98Hg==
X-Received: from dkess2.lax.corp.google.com
 ([2620:0:102f:11:fdee:d626:64eb:347e])
 (user=dkess job=sendgmr) by 2002:a05:6902:100a:b0:dc2:4ab7:3d89 with SMTP id
 w10-20020a056902100a00b00dc24ab73d89mr164696ybt.1.1707426261938; Thu, 08 Feb
 2024 13:04:21 -0800 (PST)
Date: Thu,  8 Feb 2024 13:03:52 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240208210352.2056495-1-dkess@google.com>
Subject: [PATCH] conf: fix typo in parser_test
From: Daniel Kessler <dkess@google.com>
To: wireguard@lists.zx2c4.com
Cc: Daniel Kessler <dkess@google.com>
Content-Type: text/plain; charset="UTF-8"
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

---
 conf/parser_test.go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/parser_test.go b/conf/parser_test.go
index 25d906fd..36985c5f 100644
--- a/conf/parser_test.go
+++ b/conf/parser_test.go
@@ -80,7 +80,7 @@ func TestFromWgQuick(t *testing.T) {
 	conf, err := FromWgQuick(testInput, "test")
 	if noError(t, err) {
 		lenTest(t, conf.Interface.Addresses, 2)
-		contains(t, conf.Interface.Addresses, netip.PrefixFrom(netip.AddrFrom4([4]byte{0, 10, 0, 1}), 16))
+		contains(t, conf.Interface.Addresses, netip.PrefixFrom(netip.AddrFrom4([4]byte{10, 10, 0, 1}), 16))
 		contains(t, conf.Interface.Addresses, netip.PrefixFrom(netip.AddrFrom4([4]byte{10, 192, 122, 1}), 24))
 		equal(t, "yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=", conf.Interface.PrivateKey.String())
 		equal(t, uint16(51820), conf.Interface.ListenPort)
-- 
2.43.0.687.g38aa6559b0-goog

