Return-Path: <SRS0=V5dh=GG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BACC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 16:45:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9000E20780
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 16:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9000E20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e5a83f7;
	Sun, 3 Jan 2021 16:33:52 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6cfadd0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 16:33:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=aVcnNwjjOHeqm4sHZvFy7Ef7MA8nq+nwITdkWUIE5r+UugdJaSsvpZvPI56hZShgNhUoYBf2QDbl2SHebuSkuXLb6b1JHOb+I89x+W341gHcxfQqF9E55ZV3qP7B9z38eBsJ5BIdd0zl/gVFivG1HgKxQMVOzXOAacT57FqG2j8gW2Yc1mTh7qBEt0779TaYr7pV8ofC5BSyiGa226Isa19i4DB2WwlvpO7relUm6K7wlL8al7ICkE7E8UaiT2nLVvd3ybhKpu6aCtJEU2fd+qcR7eBS5kQ+qaHQYSP2Cv2yUL2UCo1QkB+M8V8x0KEgSLZ/Vo6faFKuEEfE6F9Skg==;
 s=purelymail2; d=msfjarvis.dev; v=1;
 bh=uUekTx2Q4mHY4KkOShSQ5nCkMV0Sww1CNRkuzfE8Hw4=; h=Received:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=dMrzX8ouhD5c1ZwFOmEuMBjgI26EPXecGB2Xy9SnnIPZhvqHf7URplUgd9JuMOLNIK9HekutqWIRBX8Hy7jk8A70yEQt/Wxf9Qjakorq9nrO6qRwSWfz7wNbAM4dO/FLIKBLzLqCEANHG/UOcfdDcj8SqHE8df5xfwFVFIr0vN/WW41mhaBzuLShz7K+s+F+yCUV85UoXDLjdwlVbk+1mDHKTzpJrOqq3baaeb3eroTNiOAc8UwB510xyZANFpzdGnRW2ITG9GBxTllbb/OlBCRRLPcyd8JZ8VoiZuBko9bQaWdExEfxTMtvMXDL2U5OgWJI/4Afcxhdfq0W347OFw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=uUekTx2Q4mHY4KkOShSQ5nCkMV0Sww1CNRkuzfE8Hw4=;
 h=Feedback-ID:Received:From:To; 
Feedback-ID: 322:138:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by ip-172-30-0-124.ec2.internal (JAMES SMTP Server ) with ESMTPA ID
 1380558890; Sun, 03 Jan 2021 16:44:19 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 03 Jan 2021 16:44:19 +0000
From: Harsh Shandilya <me@msfjarvis.dev>
To: =?UTF-8?Q?J=C3=A9r=C3=A9my_Prego?= <jeremy@pregonetwork.net>
Cc: wireguard@lists.zx2c4.com, team@wireguard.com, Jason@zx2c4.com
Subject: Re: wireguard android don't prefer IPV6 endpoint
In-Reply-To: <9367b4c7-73a1-93f6-ec6d-6d7c0cca25cd@pregonetwork.net>
References: <ead64d0f-af1e-8d5c-3d87-ed14902c5e1e@pregonetwork.net>
 <64137c2f-266a-1a06-9130-e8b42ecd4edf@pregonetwork.net>
 <37dc844baef3dd8540df172318dafa21@msfjarvis.dev>
 <9367b4c7-73a1-93f6-ec6d-6d7c0cca25cd@pregonetwork.net>
User-Agent: Purely Mail via Roundcube/1.4.7
Message-ID: <d7c48275343521221132f0f08cec6f6c@msfjarvis.dev>
X-Sender: me@msfjarvis.dev
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
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


Hey J=C3=A9r=C3=A9my,

On 2021-01-03 15:58, J=C3=A9r=C3=A9my Prego wrote:
> hello Harsh,
>=20
>> The WireGuard Android client is designed to prefer IPv4 over IPv6 as
>> of now
> why did you make this choice? is there a known bug with ipv6? I think=20
> it
> would be useful to put an option in the wireguard application, so that
> we can choose.

Seems like the origin of this behavior is this[1] commit that cites=20
issues with DNS64. I've CC'ed Jason who originally wrote the commit and=20
should have better insight into it.

>=20
> if I want to use an ipv6 tunnel, do I have another solution than to
> create 2 tunels, one in ipv6 only, and another in ipv4 in order to be
> able to use ipv6 when available and ipv4 when the place where i am has
> no ipv6?

I believe that's the way as of now, yes.

>=20
> I did not manage to add 2 endpoint in a single tunnel to put an=20
> endpoint
> only ipv6 and another endpoint ipv4 / ipv6 to bypass the problem
>=20
> thanks,
>=20
> Jerem
> Le 03/01/2021 =C3=A0 14:48, Harsh Shandilya a =C3=A9crit=C2=A0:
>> Hey J=C3=A9r=C3=A9my,
>>=20
>> On 2021-01-02 08:27, J=C3=A9r=C3=A9my Prego wrote:
>>> I confirm the same problem in wifi
>>>=20
>>> Le 27/12/2020 =C3=A0 07:02, J=C3=A9r=C3=A9my Prego a =C3=A9crit=C2=A0:
>>>> hello,
>>>>=20
>>>> I've always encountered a bug with android wireguard when using an=20
>>>> ipv4
>>>> / ipv6 endpoint.
>>>>=20
>>>> I tested with two phones:
>>>> Huawei p10 lite android 8.0 emui 8
>>>> Xiaomi poco m3 android 10.0 miui 12
>>>>=20
>>>> When i'm in LTE (not yet been able to test in wifi), wireguard=20
>>>> connects
>>>> to the endpoint in ipv4 and not in ipv6, and i don't understand why=20
>>>> it
>>>> is doing that.
>>=20
>> The WireGuard Android client is designed to prefer IPv4 over IPv6 as
>> of now
>> (https://git.zx2c4.com/wireguard-android/tree/tunnel/src/main/java/com/w=
ireguard/config/InetEndpoint.java#n97).
>> This may or may not change in the future, and we'll announce here if
>> it does.
>>=20
>>>> However, chrome, for example, does use ipv6 by default and not ipv4.
>>>>=20
>>>> My phone does recover an ipv6 in 2a01: cb1a ........ / 64 and not an
>>>> ipv6 type fc00 / fd00 / fe80 ...
>>>> I also specify that if I only have an AAAA record, the tunnel works
>>>> fine
>>>> in ipv6. but suddenly, I can no longer connect to wifi which only
>>>> have ipv4.
>>>>=20
>>>> I would like wireguard to favor ipv6 when it is available, and
>>>> otherwise
>>>> switch to ipv4.
>>>>=20
>>>> Is it possible ?
>>>>=20
>>>> Thanks,
>>>>=20
>>>> Jerem
>>=20
>> Cheers,
>> Harsh

1:=20
https://git.zx2c4.com/wireguard-android/commit/?h=3Dc23d58bc27cf9807fc3405c=
8c99cc67cf4b21f25

Cheers,
Harsh
