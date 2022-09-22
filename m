Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF736C6FA86
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 09:55:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 96335203;
	Thu, 22 Sep 2022 09:44:37 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a976f42d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 09:44:34 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id 13so19767540ejn.3
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad.net; s=july2021;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
 bh=v/qvPuMPc4usaNjEg9qivBi6TDhFSwA4da46KReVd3w=;
 b=fOktN+avBqyfknSTLvRKVpfBZRo8XVS6HNiDk6kkPq088oILrJGwgnoBv2NyGMkUIw
 ezuyWaQ/6AqMNWrdcpQI5jcwKl8oiN8MxMRRgPD5q5GONDxLqbIpw/4EX2V+O1WFn7ac
 RsJIKSaxzJGe1kkrDfy1H0VwqTer1RpFlvHUFAUheGo1NmZI2WpkIjefXO8l2ox8Zd5u
 ZhHOmBikdR9Eg45LFoyl4PZW9JfaUvzA5DN1VpeX1eo/y/ML933gtFhZ6zyusMIPqgTO
 4V3Z3O9K7aKxImVEpxTEw8uFa+pzxTrcgPXrEGOyXjrsTdVPW2fr3gOLTzRfoBm2H4SK
 o6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=v/qvPuMPc4usaNjEg9qivBi6TDhFSwA4da46KReVd3w=;
 b=AUJ6wGqAFNsUGZZCH3vgVjSfdDHcbQG4PvLfl/QjVnyhlKaMhQGwd2WDi5ACje555h
 iJpycduqTCsV2vRlsFRSr/sGESP1dHrNmp2IzvYygbgwkPYtbauxbRvhA6NpoOHCC7VP
 NvnZ1oCtnD7ZSvewaBKFY/yFMhsnr7057c+MVQB2o42d3ZrzNad4nNSVSfu2r75fhg1+
 udwcIcc1588Db36fMfN1JfNeIolKXXARA569IluV0r0swCO+2qNUWhGB1eMuUnooII3g
 e92e1c5rUfOJa/g5E1garAv5mIjhy4/AJiXs/L8Fg7aEkGWST6FkHx4nNWj74XgwWASx
 e/wA==
X-Gm-Message-State: ACrzQf0p27FcJ4nyTZiG2bOcaCh6SpHgdF/KcwoNTIpL6f6m/t86mHE5
 MJGicPFmzmVhIhy/Q0suFPFdamPdPOWNTg==
X-Google-Smtp-Source: AMsMyM4zwa+QbXY6NWTI8/wxg8yuVGW+xB+8lKyJ/89H8FzTY0NRAdLHh6wpYgoqoy3qHXGvUVIr2w==
X-Received: by 2002:a17:907:9482:b0:780:ed1f:8d40 with SMTP id
 dm2-20020a170907948200b00780ed1f8d40mr1999278ejc.745.1663839874091; 
 Thu, 22 Sep 2022 02:44:34 -0700 (PDT)
Received: from smtpclient.apple ([176.76.242.102])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a056402034e00b004478be33bddsm3401690edw.15.2022.09.22.02.44.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Sep 2022 02:44:33 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Wireguard iOS crashes after upgrading to XCode 14
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <CABBZOs=9VVSDEGPw1eQWmusJotA5toLCn1-uNQeZ+moPthAOxg@mail.gmail.com>
Date: Thu, 22 Sep 2022 11:44:31 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6E42D7CE-E03C-4D87-B9CD-182567D9C087@mullvad.net>
References: <CABBZOsks3ZnpcURYHSQcaWCe8ETY21zitPY5TvtTaAm38DT5EA@mail.gmail.com>
 <834CB179-958C-4C0E-8B17-9918C8A992FB@mullvad.net>
 <CABBZOs=9VVSDEGPw1eQWmusJotA5toLCn1-uNQeZ+moPthAOxg@mail.gmail.com>
To: Houman <houmie@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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

Hi Houman,

I believe that the crash coming from withMemoryRebound is actually =
assertion (assert()). Very often assertions are stripped out from =
release builds, so I guess it could be the reason why it just worked in =
release builds.

Jason has already replied in regards of releasing an update.

Best regards,
Andrej

> On 22 Sep 2022, at 10:56, Houman <houmie@gmail.com> wrote:
>=20
> Hi Andrej,
>=20
> It works, well done!
>=20
> A strange thing though, before your patch I was still able to connect
> to the VPN server, if I changed the schema to Release instead of
> Debug.  Now with your patch it also works under Debug schema, which is
> fantastic.
> What could be the technical reason that it still worked under Release?
>=20
> And what will happen now, are you able to actually get this patch
> released on the official repo? The repo hasn't been updated for a
> year.  :-)
>=20
> Thanks,
> Houman
>=20
>=20
> On Thu, 22 Sept 2022 at 09:31, Andrej Mihajlov <and@mullvad.net> =
wrote:
>>=20
>> Hi,
>>=20
>> I think we have a bug. If I am right, basically in both IPv4 and IPv6 =
extensions, withMemoryRebound takes capacity which is actually a number =
of instances of a given type (sockaddr_ variant) and not the byte size =
of a struct.
>>=20
>> Could you please patch your WireGuardKit with the following commit =
and see if it helps?
>>=20
>> https://git.zx2c4.com/wireguard-apple/commit/?h=3Dam/fix-addrinfo-crash=

>>=20
>> Best regards,
>> Andrey Mikhaylov
>>=20
>>> On 13 Sep 2022, at 14:41, Houman <houmie@gmail.com> wrote:
>>>=20
>>> My existing Wireguard iOS implementation stopped working after
>>> upgrading to Xcode 14 today.
>>> When trying to connect to servers that support only IPv4, then it's
>>> fine. But if the server supports both IPv6 and IPv4 then the tunnel
>>> crashes:
>>>=20
>>> This IPv6 extension in
>>> wireguard-apple/Sources/WireGuardKit/IPAddress+AddrInfo.swift =
crashes
>>> with a Fatal Error at addrInfo.ai_addr.withMemoryRebound()
>>>=20
>>> The whole extension below:
>>>=20
>>> extension IPv6Address {
>>>   init?(addrInfo: addrinfo) {
>>>       guard addrInfo.ai_family =3D=3D AF_INET6 else { return nil }
>>>=20
>>>       let addressData =3D addrInfo.ai_addr.withMemoryRebound(to:
>>> sockaddr_in6.self, capacity: MemoryLayout<sockaddr_in6>.size) { ptr =
->
>>> Data in
>>>           return Data(bytes: &ptr.pointee.sin6_addr, count:
>>> MemoryLayout<in6_addr>.size)
>>>       }
>>>       self.init(addressData)
>>>   }
>>> }
>>>=20
>>> Has anyone else experienced this problem?
>>>=20
>>> Thanks,
>>=20

