Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4265AC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jun 2022 19:15:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 62f66e69;
	Tue, 14 Jun 2022 19:15:47 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id df4efe7a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jun 2022 19:15:45 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 2FE33920E7;
 Tue, 14 Jun 2022 19:15:44 +0000 (UTC) (envelope-from jrm@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4LMynr0BTDz3vK6;
 Tue, 14 Jun 2022 19:15:44 +0000 (UTC) (envelope-from jrm@FreeBSD.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1655234144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xMyA/fNsDKwWWcuwbYBvaAIDCEPyJ90NjWLqxns4Dfc=;
 b=N0zGuuDWkhs4rE1FwURUsVs13mg3D6UJjon2RQUu+NDgQrns23Dp6BljJnRozGYo7fS12B
 ixZFI3i3dRKeOUY+0KahL52XV5Cz1XMKk8HykqxivRSxOe2bvi9od+KUJrXbBRn2hU3mPN
 ZBGM4uxqbK2uCo0HGhOrL4WklNElz9x4AQgZJBH7NMMSVPFyt3qBfZYe4q4rhh6y4fpxbu
 ua6roUIHtTrN85Of8hmQDzyLB0HE2/rfyTcDx7IAOToPgQ0HeYZb1zYCERKYDLCkePvMTj
 1AOUhbjsPXD/J0HrVTZ8UifoFU4vaTfCHCHwZD19nfIMWhwJ+VEioD2Fe9yfjA==
Received: from phe.ftfl.ca
 (drmons0544w-156-34-173-250.dhcp-dynamic.fibreop.ns.bellaliant.net
 [156.34.173.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: jrm/mail)
 by smtp.freebsd.org (Postfix) with ESMTPSA id A6101C0B7;
 Tue, 14 Jun 2022 19:15:43 +0000 (UTC) (envelope-from jrm@FreeBSD.org)
From: Joseph Mingrone <jrm@FreeBSD.org>
To: wireguard@lists.zx2c4.com
Cc: decke@freebsd.org,
	mad@madpilot.net,
	Joseph Mingrone <jrm@FreeBSD.org>
Subject: [PATCH] compat: Update version to handle sbcreatecontrol() changes
Date: Tue, 14 Jun 2022 16:15:26 -0300
Message-Id: <20220614191526.70200-1-jrm@FreeBSD.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1655234144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xMyA/fNsDKwWWcuwbYBvaAIDCEPyJ90NjWLqxns4Dfc=;
 b=OFONUvTAFEY2oso20OPbNKMA/zQTAbz65nogKuytMr7p5/uWxMiXn8BjOhy8b9q0Qcecq7
 zj5U0Ty58MvvaFt1GZ5GVSX5iw/FWkfSWnNxGsIopS2HEDHhh7nkt5d9qWqmRX2Js3Fofg
 kLMeHtZpAVXROfcP0PYqoWo8qhS5FTyUVYtmYhCb4IZsdX/LVscObHu4c3ca0cyVbTD6vN
 s6Gj7oKqDG1uz+aE4qgKOFarPUALG8uAJlalyaff7hdHXnmkfpZnjLR8Pvd96Gp4ggLTAl
 F23L4pxAva7TWcXVwRKH01DlVvHEqG7+oOHJKfNg94/JAr6o+kJzFJarBIXfew==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1655234144; a=rsa-sha256; cv=none;
 b=OX2ts6SXosOmf7DwRfW91QsSN8Ci194gpdB65/n8RwYcbsyI3Auou3Btzre+aJUJJ87RAO
 QQ58UlQ7QaOURn9yevb/JNqarpB6Hpfznf9+FiMrJS/KR1hsHkdtRseOhOShvh1oAbniaR
 uy3k/sVEZEHHEtYTaF6DTQ6A8QLhb/SAyTm+rgO9QXBqyAcFE8pxYBZREW5grXJG8Qovs0
 lUJJf/BDmLej0z5xCEkOnoeXEvBMKPi25OENsvC4zxBmEGHykaqd48tqiCitVoLQGpw7j5
 Z86SlXPW6djj5tnRQzg18nxf98U8nUOBDcs6CubKbxl9XKKjKlQfojNM79ATeQ==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
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

The sockbuf changes to merge two versions of sbcreatecontrol() into one
occurred in b46667c63eb7 in the FreeBSD src repository.  The value of
__FreeBSD_version at the time of that commit was 1400059, so check
for systems with a version stamp less than 1400059.

Ideally __FreeBSD_version would have been bumped in b46667c63eb7,
however it was set to 1400059 53 commits prior in 3a9a9c0ca44e and not
bumped to 1400060 until 374 commits later in 85d7875d4291.  Thus, this
is not a perfect solution because CURRENT systems built from 53 possible
commits that require the adjustment will still fail to build the
wireguard kernel module.  This is better than checking for systems with
__FreeBSD_version < 1400057.  In that case, there are 767 different
commits a CURRENT system may be built from where the module will fail to
build.

Sponsored by:	The FreeBSD Foundation
---
 src/compat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/compat.h b/src/compat.h
index 8567524..d55c628 100644
--- a/src/compat.h
+++ b/src/compat.h
@@ -24,7 +24,7 @@
 #define COMPAT_NEED_BLAKE2S
 #endif
 
-#if __FreeBSD_version < 1400057
+#if __FreeBSD_version < 1400059
 #include <sys/sockbuf.h>
 #define sbcreatecontrol(a, b, c, d, e) sbcreatecontrol(a, b, c, d)
 #endif
-- 
2.36.1

