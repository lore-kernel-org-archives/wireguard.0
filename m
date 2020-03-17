Return-Path: <SRS0=h/53=5C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F93C10F29
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:24:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 308AB20663
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=isnic.is header.i=@isnic.is header.b="Q3EA/LVi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 308AB20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=isnic.is
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54c0a302;
	Tue, 17 Mar 2020 17:17:36 +0000 (UTC)
Received: from aker.isnic.is (aker-syslog.isnic.is [193.4.58.91])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 941d7c8c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Mar 2020 16:07:21 +0000 (UTC)
Received: from sirona.isnic.is (sirona.isnic.is [193.4.58.72])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by aker.isnic.is (Postfix) with ESMTPS id EDEE375932
 for <wireguard@lists.zx2c4.com>; Tue, 17 Mar 2020 16:13:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=isnic.is; s=20180821;
 t=1584461614; bh=lgHCgZkFW7x3DmFOOqofpJXG2eqCMnsV/27axRm+6GE=;
 h=Date:From:To:Subject;
 b=Q3EA/LViQoxuKX4CFi5ajhxSmPDK/4jUocVqs6PsjYfSpK6CDA25sBRZ5ZP5S9d1k
 bzyb8nsCdSJN0K8/wbI4VToS1KKBmZu6buzFPQSfQ50zN0dH0T5x4t9ubtTtMnCLUw
 FGxlplR8pqIDRGZqpk3O/Bnmx3meb47/rMvHpEQfH7SL64kd0p7pRsPpH2c564uyZw
 Hzv7xW8C9wivmtGXxiRJn72SsMAuJqPz5SxMlZe/6AlJ8L7tyBE4B233t+uJGaAbXd
 eXhBeRnP2bU8n5tl5fYxadpMySz2UqfgQ1aXKrxoEyXNYPvX/v0YPFAgVfyuegC+At
 EBQVVG9WLuonA==
Received: from localhost (localhost.localdomain [127.0.0.1])
 by sirona.isnic.is (Postfix) with ESMTP id DEAEE11772A8
 for <wireguard@lists.zx2c4.com>; Tue, 17 Mar 2020 16:13:34 +0000 (GMT)
Received: from sirona.isnic.is ([127.0.0.1])
 by localhost (sirona.isnic.is [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jPT_mFDygSqv for <wireguard@lists.zx2c4.com>;
 Tue, 17 Mar 2020 16:13:34 +0000 (GMT)
Received: from sirona.isnic.is (sirona.isnic.is [193.4.58.72])
 by sirona.isnic.is (Postfix) with ESMTP id C2D0A117722D
 for <wireguard@lists.zx2c4.com>; Tue, 17 Mar 2020 16:13:34 +0000 (GMT)
Date: Tue, 17 Mar 2020 16:13:34 +0000 (GMT)
From: David Steinn Geirsson <david@isnic.is>
To: wireguard@lists.zx2c4.com
Message-ID: <582744509.1200952.1584461614719.JavaMail.zimbra@sirona.isnic.is>
Subject: 'wg syncconf' and interface addresses
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [193.4.58.72]
X-Mailer: Zimbra 8.8.11_GA_3799 (ZimbraWebClient - FF72 (Linux)/8.8.11_GA_3787)
Thread-Index: WmK76rSoHXA5WugM3prD6Y8AYXAZWw==
Thread-Topic: 'wg syncconf' and interface addresses
X-Mailman-Approved-At: Tue, 17 Mar 2020 18:17:36 +0100
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

Hi,

In the wg(8) man page, under the section CONFIGURATION FILE FORMAT, is a li=
st of allowed keys in the config. For the Interface section, it lists the v=
alid keys as PrivateKey, ListenPort and FwMark. However, wireguard configur=
ation files commonly have an Address key in there as well, and it is used b=
y wg-quick to configure the wg interface IP address.

The problem is that such a configuration will fail when used with the wg to=
ol. For instance, it is not possible to use 'wg syncconf' with it, as it wi=
ll complain about an invalid configuration.

Is Address a valid key for WireGuard configuration, and if so should the wg=
 tool not parse and apply those changes as well?

We are hitting this issue as we have a WireGuard server on FreeBSD. I'm try=
ing to extend the FreeBSD package rc script to support graceful reload, and=
 ended up having to remove the Address key from the configuration and confi=
guring the IP address as part of the rc.d script. But I would prefer if 'wg=
 syncconf' could handle that as well.

Best regards,
Dav=C3=AD=C3=B0
