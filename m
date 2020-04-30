Return-Path: <SRS0=YtMA=6O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8123CC47247
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Apr 2020 13:57:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5C862063A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Apr 2020 13:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="jLdMsu45"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5C862063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11b4765a;
	Thu, 30 Apr 2020 13:44:40 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f5f02b96
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Apr 2020 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1588254990;
 bh=UAQ5y16e3lyD1crxJDuRJVbmFV/cvhVI0XEnVulzE14=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jLdMsu450O5s9/slCjYOXV6RCjNqnyu/fVlHjts+qc/s5a9uN50i2GxiaWWa5c5Xk
 lUpG1M6R8DhHmynqIbd5SBYCl8iZm8iSaY94lL5gfOO1I61MRqLOLjfRn1Y5WPuJ5G
 71uN+LKcfHSnTaXRHvSl8amJctTvwWDdm6DGftmI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([87.166.109.173]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCOE-1jrAk60iF2-00NBX2; Thu, 30
 Apr 2020 15:56:30 +0200
From: Martin Hauke <mardnh@gmx.de>
To: wireguard@lists.zx2c4.com
Cc: Martin Hauke <mardnh@gmx.de>
Subject: [PATCH] systemd: add file wireguard.target
Date: Thu, 30 Apr 2020 15:55:51 +0200
Message-Id: <20200430135551.9911-1-mardnh@gmx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sKRpxXF/0ovUSty2t0sdS27Z0Zeum00jMEDL8uLV4z5LP4APulS
 +YUFXCzDJsrM89vMj70I19nQCeBtoGZIzpi9A/ZqxTmLuYoIPyOBqjPAEMg7yP+nreGRTIz
 yMmoPwIIxGTxRuEuig+cL7Itvv3er8XDNubrypPDzKwJ+CRjsaf6F370duefkjhczmn0/7H
 pdz3G4N78B+gysncO0IWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7eprBWHdvMA=:kvC22qidDq7TaAaWO0EnO3
 TS5SFQ41PyRuw8bzRoqRcTLDEYNq5FAZXcGOWIZ28pBss4+r1MWYkHJgEGe1COiERAq5VtzEI
 GctqYgEwJv1Yq2WJ9gsZytslk0V6BBXSxkn/71mrGTVXWImMmaGv7EGFjmvxpM8VKobGoXP/v
 Y1u00yz7Ye8PHgY9sHap9ngL3wISG2kZbwFxz1ZNqBTQOcgdHamIOOaJJHIgR4ipdOM73t0mW
 hr439074TTCMrqXjhVN/Qu/ouTc86+NHwnVkEnUJuINrz0032S+UT3hgXWzBYLe8NL/7sL/p+
 t708Jz2/F6gIMW4vD7gPqREgOMZp4JDavtYjx1z3i0iiwnCtmJTLrd/QDNNLbWs3lD6SChYQ0
 IO+YAF7KzvVGLv6htNWvVexs7cf63nAXinP9ov3aeODEQdj38SitROZ2zwxwlDeXmsJiiCjeC
 8Pr15DlpHyq15Wd06j1IJtDkQ1rfNzhvOxbU086mkuTIDRMfXun6LFKmt2LAwh3fUXxvh6dVX
 nww7EpRsJLsUylYtWtKkHLUCZu8y364aIWTyBtk0nCBwTSGq4yO9v7juYV1yRt7nBAD+a8rg8
 QZx25fGzYgUQ1sacPihHLg/BcAPtvzyIIlUTr3jRgxU6ipzOIlJX1ES5cTVsQK8GXzCOuSwBb
 MS9MOLtlz49QQGdv2TqJA01WQ9kf3V0HqcHeyXNdHUoElhl6TCqF3o8z2hKzKVaGnPPPfmXsl
 HjyvfDOZ1R4+SNjaSQiD3AYkD66b+m+ydpz5Q84C9u8mx08ycdnF04BC1GQLKxc30oieuapuj
 XZjTpFtqyLirD93CDNIazhKe0jB7zReIcEiFpjTVgpaAL/6eI1akKMDK4R/LI/K9HfmElRL7P
 KQBktxUk4ce1p3TasJPrlF9Hq6VMzAj8JsF+vo4zySrMPUttqm1qZ7E6YbbgiUwq3plm3f1P2
 NVfwctId2BUlqhA2YrqrA7VbEtiHf9VfNP5yv7Ula9hESArHgqstFL2SmiPOpjUYsW/H9CuV9
 vnUljh7uRkPetx0HUcWfeR1JdDS/mZfFwLxSb4NFu4S3V0Z+V8QLxpcPq7DjBzmG9J4Kdu8CL
 m0HElX5bwuiOVBfYptExBfVquUwS6kM1+v8r2cPfMOXbtGBNdvfmRsJm4Xwj4v11hq+3tKcc0
 IzZ0XWcKO6ZL8cSQtreF0Zv/5joSZ+60dvP4ylFnN288OT0y6UarM/DM0XOhuFO0gMMS0zIHp
 9HG3MJJJDqxywGPRb
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

Add file wireguard.target, which allows you to stop or restart all
instances.
=2D--
 src/systemd/wg-quick@.service | 1 +
 src/systemd/wireguard.target  | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 src/systemd/wireguard.target

diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
index 7c5f9d1..c22f7b3 100644
=2D-- a/src/systemd/wg-quick@.service
+++ b/src/systemd/wg-quick@.service
@@ -2,6 +2,7 @@
 Description=3DWireGuard via wg-quick(8) for %I
 After=3Dnetwork-online.target nss-lookup.target
 Wants=3Dnetwork-online.target nss-lookup.target
+PartOf=3Dwireguard.target
 Documentation=3Dman:wg-quick(8)
 Documentation=3Dman:wg(8)
 Documentation=3Dhttps://www.wireguard.com/
diff --git a/src/systemd/wireguard.target b/src/systemd/wireguard.target
new file mode 100644
index 0000000..8e59224
=2D-- /dev/null
+++ b/src/systemd/wireguard.target
@@ -0,0 +1,2 @@
+[Unit]
+Description=3DTarget to restart all parts of WireGuard
=2D-
2.26.2

