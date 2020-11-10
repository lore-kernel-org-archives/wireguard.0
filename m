Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159D2C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 09:24:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07CD120781
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 09:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Axi42+Og"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07CD120781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd71524a;
	Tue, 10 Nov 2020 09:20:21 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8263e35f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 09:20:20 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id q5so7892335pfk.6
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 01:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=AG0IZtikyNoKidLBi4Nlq9b3ai9jUEXyY83jS2uIdh4=;
 b=Axi42+Ogi+HKgS0ZJxVZ502s1psvMPDg5QX8sLdkxTmR8f/0+xMjIQ29iGDxPhuuKx
 OHlUdrZhNDYy28kMdmO7Vy5ZBxorRBQYKBjWKzXLB7hRgX1TjBuZZbu886+fF54sxejX
 s35ESdY/FgPfNZ44BhDrFQJdXUIrCWiFdsydSrRhTcbBv8fZR/1TpHR93GpdpMn6TIrs
 NxYhUJfw339BAYf3JHHz02DQ++YDo98fqEemQr6x/7azVTwBwz9iAAJwD1Gm3U/NQN7r
 7nLFUuCUN9rLuh+gg5KMMgFkXnewicoeY6aw3sAwfOG37P99gWNcyw6d3k6jmtuITu/V
 pmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=AG0IZtikyNoKidLBi4Nlq9b3ai9jUEXyY83jS2uIdh4=;
 b=Dcu7Zzo13zrZ1Xvrcn4LI1CwV5/wdMn1m+w5+Em4i8mzkG9uIfUcRg5Hm2uGpvlfSI
 E42pCk3Xemn3FSgtSrxNbXjYkRJK+FpPi/VRhr9aync+rIC9ZeYzP+DADz+sGTq080F5
 u5I6UA941ZblIjKJosY5yNPRsJSZbm0OsKKHjoqym5py4Xf8UZz+qEeM3O0iR8lvQg7v
 MuEeJxE+cskHX0MC2x5NcVD75VlQYMRVnXjvzihmvkwXag13ID1/09SNDi/TYC9TmRfO
 KFkO/ogOK67KOw97wvbII8s2RghkY0Hswo6zjPztzNqh0i0ocP7GMWrStZH2MwrVV6qL
 XMog==
X-Gm-Message-State: AOAM530vvFrqonf/lONa6avCdMxxG5zFhlUgW5OwbLr4LTLlEjxKrfa8
 WcY8eahHngXFasFO+t065ho=
X-Google-Smtp-Source: ABdhPJyBd4Eo7Wj7lTObmIxYKxt8/5FOI77SIhAVGPmWkngxjoOXbXcrYIGnHIWH+OofYdPy3ViMTw==
X-Received: by 2002:a62:de44:0:b029:18a:ae59:4d74 with SMTP id
 h65-20020a62de440000b029018aae594d74mr16706334pfg.72.1605000239971; 
 Tue, 10 Nov 2020 01:23:59 -0800 (PST)
Received: from [192.168.1.224] ([157.245.162.40])
 by smtp.gmail.com with ESMTPSA id j13sm13324760pfd.97.2020.11.10.01.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 01:23:59 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mo Balaa <buddybalaa@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Transient Connection Issue
Date: Tue, 10 Nov 2020 03:23:57 -0600
Message-Id: <0A5C340C-6B05-4C75-9F0F-B72A56D55FBB@gmail.com>
References: <589074B2-A2F2-4B87-AA27-0B60704A5798@tomcsanyi.net>
Cc: Ashish Madeti <ashish@provakil.com>, wireguard@lists.zx2c4.com,
 Pulkit Anand <pulkit@provakil.com>
In-Reply-To: <589074B2-A2F2-4B87-AA27-0B60704A5798@tomcsanyi.net>
To: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
X-Mailer: iPad Mail (18A8395)
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

Check your MTU across your paths. In my experience, transient connection iss=
ues are due to MTU oversize.=20


> On Nov 10, 2020, at 2:20 AM, Tomcsanyi, Domonkos <domi@tomcsanyi.net> wrot=
e:
>=20
> =EF=BB=BFHi Ashish,
>=20
> With the amount of information given it is very hard to comment anything m=
eaningful.
> Have you gone through standard network connectivity issue investigation st=
eps?
> E.g.: does ping work? Do you have correct routes setup? What does wg show t=
ell during downtime? What does tcpdump shows on the wire?
>=20
> Cheers,
> Domi
>=20
>=20
>> 10.11.2020 d=C3=A1tummal, 0:21 id=C5=91pontban Ashish Madeti <ashish@prov=
akil.com> =C3=ADrta:
>>=20
>> =EF=BB=BFHi All
>>=20
>> Background: I am using Wireguard VPN to secure intra-server
>> communications among my 5-6 ubuntu servers sitting in different data
>> centers.
>>=20
>> Today, we had a downtime of around 15 minutes because the server
>> running nginx was not able to connect to the web-application server
>> using the wireguard interface [0]. I ascertained that it was not a
>> connection issue between nginx server and web-application server by
>> trying to connect to web-application server via its public IP, which
>> worked [1]. I even tried restarting wireguard service [2] on both
>> nginx and web-application server but to no avail.
>> So, before investigating further, I decided to first route all the
>> traffic to a failover server (which was also a part of the VPN). It
>> took me around 5-10 minutes to pull the latest configuration and
>> application changes onto the failover server and then route all
>> traffic to it. Once our site was up, I again tried connecting to the
>> original web-application server from nginx server, using curl, but
>> this time it worked fine.
>>=20
>> Can anybody help me understand the problem or anything I should try if
>> it happens again?
>>=20
>> Please let me know if you need any more information.
>>=20
>> [0] Tried via curl. curl 10.0.0.10:8080. Received the error
>> 'Connection timed out'
>> [1] curl w.x.y.z:8080 returned the html content as expected.
>> [2] sudo service wg-quick@wg0 restart
>>=20
>> Regards
>> --=20
>> Ashish Madeti
