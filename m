Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E28C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Sep 2021 11:50:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AA3D61038
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Sep 2021 11:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AA3D61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 836b7902;
	Sun, 26 Sep 2021 11:50:31 +0000 (UTC)
Received: from sonic317-28.consmr.mail.bf2.yahoo.com
 (sonic317-28.consmr.mail.bf2.yahoo.com [74.6.129.83])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4ea997b8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Sep 2021 11:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632657025; bh=ztEPjrcRHGvR5FKvzbLiC7vTuAofae58YdjawMvMgDM=;
 h=To:References:From:Subject:Date:In-Reply-To:From:Subject:Reply-To;
 b=o1+saba9gK2SqJbABj10h+aqUOq5Gnbba78IGDzQnbsKaGPGK1OJwb+SEIyLc2aNGAWpRnynaeecN6evtVq66r/h9PnAB+YN1a0Yfn0sgmdVhlNujMrOC5rDMtU6YfzSYFR4nr+Ky3g9xQCkAP+LQbdPzk06tV4R+NS7IuteJs0UpQo7R3CvNvw1BcKI3REAnoT0W3cL2rzfhudl02pUQcL03JG+YVfc1+M6cwiqgDSoM5cK95ZOEK39Rx2FRKe+Vh64nDTBQ1HZWW6V3A8YgRtd7I2ina97lrdTMyH+gkWTMKZ8+4816jv15mrXYZTj/FDCIkYEi6q2FQqCe7Qryw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632657025; bh=MFIDgP79A4xDN/26WTgks0k2pBEee7QOPJGpIuwbvBP=;
 h=X-Sonic-MF:To:From:Subject:Date:From:Subject;
 b=LMqNRCkyZ0/c5cnX+PaH57PJcLLuQLq9MPW42xKesexXIaoSRxCIvE5qctE4FuoHfD0Tr/9nyRKkibRrBr7ulVYlielK5nDwoSuEekSDfjlG9FSdo+F8wg4pY8iq2cGiFRyRfTUhI107PbgIbSfTOpTkuYf2cuY/G3NBVDcXYoxriH7EvVVkrEtsqwWQerDRGgznk3uMNovs7efXy15pjfQUz1dffdiaoA5U5hE7b7cpIMS8wPLFG4qda94i9Zbe86RpgHpDQlv9jkNX+xH5AIbN0KH+LxToM4fraMo1yA83BLxus5hEgBk1rV5Blr6EQpVVrwSx/JnBkIDDlo6u/A==
X-YMail-OSG: hTXYcIoVM1lm00VVMoJ33suFkWjc..qsbw2L.7OIU5omjPw1jjoZ_s3py3W3mk7
 aKUtsq7BpWm4nfmjZUQDUC.pgnd9OFvDzoU8LboFHkBZ5whM8eKe832Da9b1nKUhlt0_4.dhXacI
 39eb7q93WrKrc2htwDputCMgnhH0GpCc3y5FX6uFeGWyhk7s.oyV7dtIwWiaebRY91odW525Fc0F
 kbNbJK5IWtj0ZelWYvIt7tTFi4mm36BA2e3G3_sxZPMoxDcMXsOhP.V3VwzHzUY0fSHGI1zh.63d
 3cyfk6haNknvjN9ZgJCEn59k_DvN.BH3QS9pP_TapDoJ1fST7BOKxBgOcVhhK8t9dkSuoZakqNsv
 huARsN7TEDR1fHnT9VUdvgDy6dWIFhgH5SR5BGK5.FKQkvwOg8TYIhIsta1wmfcEez5zxwcqlKi2
 IqM5hsbvAzcaCdT3O4ILIy7Vz.WdnbHDRz4psbfDnIfN4VvGd7wlM5DbUt_u6p3RXzW4YJyTi8fC
 ycJCQW0xhAqN8v4xOErQ.6aEO.r3YIt8nC7s0VXOSXMxp8AAjRnRmmB3VZql9E45AH135t.lI9vD
 CNCEUoDn5gQMOZS_7lftLlf7CVYOK4v9ipPh.YeqGhsW3YbGrzELkNeq_kv5Qv_1vH4KWPLMXDsZ
 fdHbN8QO2CaWmAmcSh.yg41qObR2sKvD1L6uBZ2Ac2o.7n1iXaYfjMhBe9S1PkKYrhWf_aEENf1E
 ewiX0uFGNEdDzbgMiSTLgef6WlNPucGWoiA8EpBLnSjkaERs4vgLdI7EL._XovV4kjZZbxwMMs9V
 fptFxRUElMC87nuceIbltrRM0uYLOCIZ5Y2Ty._jE_HABcJltvYvv.18JA3LeXxoxn2KgPzxJnWR
 pDTLFd_KSd1Dbp5EsRL85rCgOKGAJXw28CiOxfV2C8WYZLkNdvXLKIIGQsm_A.jwPrBEhMM1wTCD
 PeMI2SKelbb4iUmPcZGAkA7GrLFQvKoSQCvExnOOWey7C79C16zNjX4VGyK.IHco2sI5vh31PMB5
 tnbRqCGZT2qdVkKbcmJOlJDTzknWEWuw9NnwMOwqW9Tw1.kY24RyyU.n2RhLl_U3lfGmL4Ic.h3A
 ltVlobt1Tbs2oQseEjbmXhpKywAvIXUczwnvovaWe20DZ38TkwyvUPVbjZAkZMybfV9JTXmOAUjG
 cAWdYJqPObXF0.gtlVg9tUMw2iA7gs1WoRAChzWX97UvqQtAKmbQkq6n.d28QsUBv68DNCONowoL
 rlRKV.RWRqm8MYn7G9H7FAtfrgFiCzreQYl8sFfkYjTkJiX.LDmv4WuHIYJnwCWXgEVMDpMITK9n
 l65W6fQBMEiTc1.t0U65IfQXAPies8XxfuE3ytos46bxRTZm7uYCXj76TruH8TBjbfMSzSh7._Kn
 KzMYQjVjyrluydv7n1p.RjCLnTepVfpYcL7CQZnUyaeeM5NeyHR3MoqfzfJsoVdlBy08MS3fNgal
 F3is5LWQVuoLBc3E6.6izGjgFL08iDvuoJXM2FRM7l1vNH4lHwsficr7SNDm3ESfHm7GrvuZEZDM
 _qsuge6JjN9WEtadDUgkN5FR3na5GyR7Ij9pEmUpRyqBgWcMlUlClfJoUz2VvRVd_BsKHWir346j
 s0PinSNpXzPcX5kUbTGAuqghD_uibOTUOV600EwuQm42yZs6JRO3ynWUnoIniwfRiT2751lxnTMx
 2ReBs3M4N5CmHBe84hokmM7Zx22dNiQCf_E8Z8HnHjCRHTkyVMRly4hDkvjP07gYUQnRuGtqw0K9
 rHyWposfnazm6frknymFRQQEZYKNSETnKElFIy2gF3PegpNvk5IPDgXjAXlDlcOmZAz4PkbvODz1
 8HmRedUeX9mP2.ZNbXfOqY8gqBAqCD9jNIZM4bEbcJeg1TGlHmYBWW2G9EnJf9Q_5XqmdjOPpUhu
 6LbwaRu4qDLr2kqLvN6RVpW1C5TNRNiu.BrtGevaCcRJywZzYOX_6W9kBIRcTeydIjIR0m6q6j_J
 aoAtwOsg3YqO2xBr37.GN00yj4QaJ3NW_5qjepBGJYKY_zG4kT8cIDk.LPYyqqntXRgzdpWN_UCn
 QCbvRM4m1vEs6B0pRKuJkvbkHlilEV5mu3glsEakzsjzcKLJhMTiU1cZTcOWn8zyP5rBT5X0fx01
 9J7nB1EEAH.bru8aXW_IrkNYmrrq.Kjt.Pj.2gbz4fbxRvsizyUWbz3UlxJ.Bq14LBAwNO5XFndE
 OOdE2VmVuFKR9G6eo._NKruOqTTAqQui.AFJebpBCdEdQYwrkr.zFpBW6t01Z69h3tRo-
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.bf2.yahoo.com with HTTP; Sun, 26 Sep 2021 11:50:25 +0000
Received: by kubenode527.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 41df918d94a3077be997bd020f7716c0; 
 Sun, 26 Sep 2021 11:50:19 +0000 (UTC)
To: wireguard@lists.zx2c4.com
References: <ead64d0f-af1e-8d5c-3d87-ed14902c5e1e@pregonetwork.net>
 <64137c2f-266a-1a06-9130-e8b42ecd4edf@pregonetwork.net>
 <37dc844baef3dd8540df172318dafa21@msfjarvis.dev>
 <9367b4c7-73a1-93f6-ec6d-6d7c0cca25cd@pregonetwork.net>
 <f1b3f08f-3633-48d5-065d-b126eb32be51@pregonetwork.net>
From: tlhackque <tlhackque@yahoo.com>
Subject: Re: wireguard android don't prefer IPV6 endpoint
Message-ID: <39d400ca-bc03-0ad9-5fb9-726376ce6047@yahoo.com>
Date: Sun, 26 Sep 2021 07:50:16 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f1b3f08f-3633-48d5-065d-b126eb32be51@pregonetwork.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Mailer: WebService/1.1.19043
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

On 26-Sep-21 07:02, J=C3=A9r=C3=A9my Prego wrote:
> Hello,
>
> I think it is useful that I revive this topic.
>
> is it possible to add an option so that i can use an ipv4 / ipv6
> endpoint but using ipv6 by default when available?
>
> With the shortage of ipv4, internet operators now very often provide
> subscribers with native ipv6 but ipv4 in tunnel, hence the performance
> of the wireguard tunnel is affected by this, as it uses ipv4 by default=
=2E
>
> if this is not possible in the official client, which wireguard client
> would allow me to have this behavior?
>
> Thanks,
>
> Jerem
> Le 03/01/2021 =C3=A0 16:58, J=C3=A9r=C3=A9my Prego a =C3=A9crit=C2=A0:
>> hello Harsh,
>>
>>> The WireGuard Android client is designed to prefer IPv4 over IPv6 as
>>> of now
>> why did you make this choice? is there a known bug with ipv6? I think =
it
>> would be useful to put an option in the wireguard application, so that=

>> we can choose.
>>
>> if I want to use an ipv6 tunnel, do I have another solution than to
>> create 2 tunels, one in ipv6 only, and another in ipv4 in order to be
>> able to use ipv6 when available and ipv4 when the place where i am has=

>> no ipv6?
>>
>> I did not manage to add 2 endpoint in a single tunnel to put an endpoi=
nt
>> only ipv6 and another endpoint ipv4 / ipv6 to bypass the problem
>>
>> thanks,
>>
>> Jerem
>> Le 03/01/2021 =C3=A0 14:48, Harsh Shandilya a =C3=A9crit=C2=A0:
>>> Hey J=C3=A9r=C3=A9my,
>>>
>>> On 2021-01-02 08:27, J=C3=A9r=C3=A9my Prego wrote:
>>>> I confirm the same problem in wifi
>>>>
>>>> Le 27/12/2020 =C3=A0 07:02, J=C3=A9r=C3=A9my Prego a =C3=A9crit=C2=A0=
:
>>>>> hello,
>>>>>
>>>>> I've always encountered a bug with android wireguard when using an
>>>>> ipv4
>>>>> / ipv6 endpoint.
>>>>>
>>>>> I tested with two phones:
>>>>> Huawei p10 lite android 8.0 emui 8
>>>>> Xiaomi poco m3 android 10.0 miui 12
>>>>>
>>>>> When i'm in LTE (not yet been able to test in wifi), wireguard
>>>>> connects
>>>>> to the endpoint in ipv4 and not in ipv6, and i don't understand
>>>>> why it
>>>>> is doing that.
>>> The WireGuard Android client is designed to prefer IPv4 over IPv6 as
>>> of now
>>> (https://git.zx2c4.com/wireguard-android/tree/tunnel/src/main/java/co=
m/wireguard/config/InetEndpoint.java#n97).
>>>
>>> This may or may not change in the future, and we'll announce here if
>>> it does.
>>>
>>>>> However, chrome, for example, does use ipv6 by default and not ipv4=
=2E
>>>>>
>>>>> My phone does recover an ipv6 in 2a01: cb1a ........ / 64 and not a=
n
>>>>> ipv6 type fc00 / fd00 / fe80 ...
>>>>> I also specify that if I only have an AAAA record, the tunnel works=

>>>>> fine
>>>>> in ipv6. but suddenly, I can no longer connect to wifi which only
>>>>> have ipv4.
>>>>>
>>>>> I would like wireguard to favor ipv6 when it is available, and
>>>>> otherwise
>>>>> switch to ipv4.
>>>>>
>>>>> Is it possible ?
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Jerem
>>> Cheers,
>>> Harsh
>
I agree that it should be selectable - but note that there are many
inverse situations, where IPv6 is tunneled and IPv4 is direct.=C2=A0 Ther=
e
are still ISPs (including half of mine) that will not provide end users
with an IPv6 native connection.=C2=A0

This is a bit difficult, since the situation can occur at both the
client and server end.=C2=A0 For the server end, if the client knows what=
's
best for the server, the tunnel configuration could be set to prefer the
best protocol.=C2=A0 But for a roaming client, it's not so easy.=C2=A0 E.=
g. Using
Cellphone wireless is almost always IPv6, but if connected via WiFi,
it's almost always IPv4.=C2=A0 And if you plug your portable machine into=
 a
client's ethernet, you don't know what you'll get (or whether its
connection is tunneled).

So if the client does anything, it probably needs a 3-way switch: "Use
IPv4", "Use IPv6", "Autoselect".=C2=A0 (Or if you really want to complica=
te
things, you could break Autoselect into Auto-prefer IPv4 and Auto-prefer
IPv6.)=C2=A0 While this makes sense to technical people, it's not obvious=

that the performance difference is worth exposing the complication to
all users.

Since there's also the issue of which DNS servers to use when resolving
the endpoint name - perhaps it's time for an "advanced" sub-panel of
options in the GUI.=C2=A0 Keeping things simple for the casual/first-time=

user is a strength of WireGuard.

For what it's worth, you can specify a numeric IP address to force IPv6
- e.g. [2001:db8::1234]:5522

Of course, that doesn't work if your endpoint address is dynamic & you
need the DNS lookup.

With respect to Chrome - last I knew, it uses the "Happy Eyeballs"
(RFC6555/8305) algorithm, which tries to prefer IPv6.=C2=A0 And there's
no(longer) any way to influence it in Chrome.

Basic address selection is up to the OS - see rfc6724, 3484.=C2=A0 Most
provide a way to specify a global preference - which in the situation
you described, you probably want to do when not tunneled.=C2=A0 E.g. for
glib-based systems, see /etc/gai.conf, and for windows see the
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\
registry key.

If you control the endpoint, another approach is to add a DNS record
that only returns the AAAA record (for the IPv6) address, e.g.
endpoint.v6.example.net.=C2=A0 For situations like this, I often have thr=
ee
address records - the generic host.example.net, and host.v6.example.net
and host.v4.example.net.=C2=A0 But I try not to expose the latter two.

I wish things were simpler...




