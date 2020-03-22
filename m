Return-Path: <SRS0=Tlvr=5H=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C3FC54EEB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 22 Mar 2020 11:31:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EDB2206C3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 22 Mar 2020 11:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EDB2206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 041496be;
	Sun, 22 Mar 2020 11:24:48 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0de5b06a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Mar 2020 11:24:45 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 1A6CE2400FF
 for <wireguard@lists.zx2c4.com>; Sun, 22 Mar 2020 12:31:35 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 48lb1y1QTqz9rxg;
 Sun, 22 Mar 2020 12:31:34 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: WireGuard for macOS (cmdline vs GUI)
From: tormen@mail.ch
In-Reply-To: <34c24ae1-c4b1-33ef-cf21-2c3f72db9194@johnnyutahh.com>
Date: Sun, 22 Mar 2020 12:31:33 +0100
Cc: wireguard@lists.zx2c4.com,
 Eiji Tanioka <tanioka404@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <83BEF210-B2E5-4A47-888B-BD70516F9637@mail.ch>
References: <F77DB7FE-175E-48E4-A071-FF86D290B494@mail.ch>
 <CAA2ss9EE35hYqjOC_uY9REe-Mp0D04bPH9Ldg0wConQs8VG24A@mail.gmail.com>
 <0f81834c-6f8a-57a9-1376-e6c310aa9c5e@johnnyutahh.com>
 <34c24ae1-c4b1-33ef-cf21-2c3f72db9194@johnnyutahh.com>
To: Johnny Utahh <mailman-wireguard.com@johnnyutahh.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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

FYI: Thanks a lot for your answers to my initial question!

I did not know the ncutil command yet :)
It works like charm and allows for nice "remote" control of the GUI app =
via cmdline.

Tormen

> On 22. Mar 2020, at 04:49, Johnny Utahh =
<mailman-wireguard.com@johnnyutahh.com> wrote:
>=20
> I wrote:
>> The macOS wireguard-tools command line does not seem to work =
concurrently with the GUI app
>=20
> ...because it's not supposed to. (sigh)  Simple updates to =
https://www.wireguard.com/install/ along with a short note for macOS =
`launchctl` (or similar gizmo for auto bootup) will help make things =
more clear. Details:
>=20
> =
https://www.reddit.com/r/WireGuard/comments/fmn93h/how_to_display_or_manag=
e_macos_wireguard_status/fl5xscg/?context=3D8&depth=3D9
>=20
> ~J
>=20
>=20
> On 2020-03-21 4:45 PM, Johnny Utahh wrote:
>> The macOS wireguard-tools command line does not seem to work =
concurrently with the GUI app, at least on my system:
>>=20
>> =
https://www.reddit.com/r/WireGuard/comments/fmn93h/how_to_display_or_manag=
e_macos_wireguard_status=20
>>=20
>> Anybody know why?
>>=20
>>=20
>> On 2020-03-07 10:18 PM, Eiji Tanioka wrote:
>>> Hi,
>>>=20
>>> How about install wireguard-tools from Homebrew ?
>>> =
https://www.wireguard.com/install/#macos-homebrew-and-macports-basic-cli-h=
omebrew-userspace-go-homebrew-tools-macports-userspace-go-macports-tools=20=

>>>=20
>>> I have not installed, it seems installing `wg`, `wg-quick` command =
and
>>> "wireguard-go" backend.
>>> I think you can use them for Connect / Disconnect from CLI.
>>>=20
>>> And,
>>>> I would love to use both (GUI + CLI): No automatic connect in the =
GUI,
>>> I'm using "On-Demand" option for automatic connect, is it =
appropriate
>>> for your purpose?
>>>=20
>>> Regards,
>>>=20
>>> 2020=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=97=A5) 10:01 <tormen@mail.ch>:
>>>> Dear Wireguard Team,
>>>>=20
>>>> First off, thanks a lot for the client for macOS !!
>>>>=20
>>>> Is there a possibility to issue a "Connect" / "Disconnect" command =
from the command line
>>>> instead of using the buttons in the GUI ?
>>>>=20
>>>> I would love to use both (GUI + CLI): No automatic connect in the =
GUI, but rather automatically connect / reconnect via script (so via =
command-line interface, CLI).
>>>> And I don't like the idea of not using the GUI and switching to the =
cli version as then I don't have the icon.
>>>>=20
>>>> Thanks a lot in advance for any hint or feedback!
>>>>=20
>>>> Tormen
>>=20

