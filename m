Return-Path: <SRS0=ccJ7=5E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D997C4332D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2020 08:25:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D51F20714
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2020 08:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=isnic.is header.i=@isnic.is header.b="VHUSs8Ho"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D51F20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=isnic.is
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24a64f36;
	Thu, 19 Mar 2020 08:19:27 +0000 (UTC)
Received: from aker.isnic.is (aker-syslog.isnic.is [193.4.58.91])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7b946977
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Mar 2020 08:15:09 +0000 (UTC)
Received: from sirona.isnic.is (sirona.isnic.is [193.4.58.72])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by aker.isnic.is (Postfix) with ESMTPS id 53597759B9;
 Wed, 18 Mar 2020 08:21:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=isnic.is; s=20180821;
 t=1584519687; bh=MCRpKGN4Gaci1vTbJQAGVdtnlLmQXnQLuUWQKyPX5sg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject;
 b=VHUSs8Ho+2iqJiFiNmHFDCjccUK78ErJ2OlYxJpBrI+DftAZrFhboHsKGrz2aiCDy
 ZOnMYi4MEwgmku/GmuV1pUjl03nYqRUaE1H0m8ho/Cntfr44vXCP33L6yU71+UPNPs
 FCKiOlfEncuPJ3Oy4giDWcRsqiCRzXR2+1Y2B33bP5V0aY/RdOR7RlBZIP89R5S8w3
 hvYA33OlMnBOdhqNFzkJilBgIUVP+MowZOsUoYGBcRfV8p4TlIa1pDssrDb8tc9KeN
 3AvdcrqY1kN/GlN2UaAWZRB8QIbPl4EWXnnASRRb0kzGc2IfcZWJ/pvCTv26JIr7q9
 7Qeh97htS9WCA==
Received: from localhost (localhost.localdomain [127.0.0.1])
 by sirona.isnic.is (Postfix) with ESMTP id 4975711771E9;
 Wed, 18 Mar 2020 08:21:27 +0000 (GMT)
Received: from sirona.isnic.is ([127.0.0.1])
 by localhost (sirona.isnic.is [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id p_LU8CGdPjkp; Wed, 18 Mar 2020 08:21:27 +0000 (GMT)
Received: from sirona.isnic.is (sirona.isnic.is [193.4.58.72])
 by sirona.isnic.is (Postfix) with ESMTP id 2D4701176C45;
 Wed, 18 Mar 2020 08:21:27 +0000 (GMT)
Date: Wed, 18 Mar 2020 08:21:27 +0000 (GMT)
From: David Steinn Geirsson <david@isnic.is>
To: Luis Ressel <aranea@aixah.de>
Cc: wireguard <wireguard@lists.zx2c4.com>
Message-ID: <2142983292.1223420.1584519687100.JavaMail.zimbra@sirona.isnic.is>
In-Reply-To: <20200317183459.4m4zlie3w3ga2lrv@vega>
References: <582744509.1200952.1584461614719.JavaMail.zimbra@sirona.isnic.is>
 <20200317183459.4m4zlie3w3ga2lrv@vega>
Subject: Re: 'wg syncconf' and interface addresses
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [193.4.58.72]
X-Mailer: Zimbra 8.8.11_GA_3799 (ZimbraWebClient - FF72 (Linux)/8.8.11_GA_3787)
Thread-Topic: 'wg syncconf' and interface addresses
Thread-Index: uT/+qbaEOWxdcPS/QIUOoz9KSL7MUg==
X-Mailman-Approved-At: Thu, 19 Mar 2020 09:19:26 +0100
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


----- Original Message -----
> From: "Luis Ressel" <aranea@aixah.de>
> To: "David Steinn Geirsson" <david@isnic.is>
> Cc: "wireguard" <wireguard@lists.zx2c4.com>
> Sent: Tuesday, March 17, 2020 6:34:59 PM
> Subject: Re: 'wg syncconf' and interface addresses

> On Tue, Mar 17, 2020 at 04:13:34PM +0000, David Steinn Geirsson wrote:
>> Is Address a valid key for WireGuard configuration, and if so should the wg tool
>> not parse and apply those changes as well?
> 
> The wg-quick script uses an extension of the wg config file format, with
> config keys such as Address which aren't recognized by wg.
> 
> If you wish to use a config file with both wg-quick and wg, you can use
> the "wg-quick strip" verb to remove wg-quick options from the config
> file. In some shells such as bash, this can be done quite comfortably:
> $ wg syncconf wg0 <(wg-quick strip wg0)

Thanks, I did not know about 'wg-quick strip'. I was thinking of some sed tricks
to remove these keys but that's much better.

> 
> Cheers,
> Luis
