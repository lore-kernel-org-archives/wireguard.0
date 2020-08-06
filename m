Return-Path: <SRS0=Qc6R=BQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9235AC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 14:18:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56D5B23121
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 14:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kilabit.info header.i=@kilabit.info header.b="G8J6n4hd";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="QSWg6IUy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56D5B23121
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kilabit.info
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f31cac25;
	Thu, 6 Aug 2020 13:53:45 +0000 (UTC)
Received: from b232-14.smtp-out.ap-southeast-2.amazonses.com
 (b232-14.smtp-out.ap-southeast-2.amazonses.com [69.169.232.14])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22cf5f2a
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Aug 2020 12:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=qmu7se5xgw2loqmc5cw3bpwkrcsxkwvr; d=kilabit.info; t=1596719905;
 h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
 bh=iXZw7I6S0DPHEgUHpuHOT3lsr+OGqVQs64i7+2ajIDc=;
 b=G8J6n4hdrsTh72bfLzf2E/FW3sL0YnwZ7JIZBSk43kz9sr6TRp1jeV35MnDI7K7n
 sPPMPs4hMIHQAhhMUmCqP1/pncSi6SgoJ04tLew3/XzLX/alJ/1amOMMo680rwfjpyS
 7Ys+UgtLPEHkwTeaAFlG1tAiZxtvNSvnjdFS+bgY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ulrbq2zjesb42hdt6rpnifgor3epinsy; d=amazonses.com; t=1596719905;
 h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To:Feedback-ID;
 bh=iXZw7I6S0DPHEgUHpuHOT3lsr+OGqVQs64i7+2ajIDc=;
 b=QSWg6IUyaekgIGT5sKCz6Hmr0GqkZ/jPZtFsvi/OtaGBOUaDg7oKci8RJaOtLClC
 1wK9ptQbcTnTnQQSnH9GOb/y7iiikvab1E2rpJ4ETwh4TJN4wDnhUsSi8LsivTRDWIC
 PO5Lpe2qh7h+k5QqCbUPKSfL+CNvwmXgMlhF7Yvk=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: WireGuard macOS App doesn't set system default DNS
From: Shulhan <ms@kilabit.info>
In-Reply-To: <CADn-QaMEbXB9T9xMz3QQ0rFOKSGnR0mTgEtydAUrYoPJgULaSQ@mail.gmail.com>
Date: Thu, 6 Aug 2020 13:18:25 +0000
Cc: Gijs Conijn <egc112@msn.com>,
 wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-ID: <01080173c3ec3af0-1dd63a48-4c02-42b8-b52b-0b0b65366ff9-000000@ap-southeast-2.amazonses.com>
References: <CAO8prk+D0zuzExJ9KcD5xJT1tGiVVHQO1Bs3ExBoUy7=Y0mhoQ@mail.gmail.com>
 <AM0PR07MB614721A4B6B17011C3DFF7C0964D0@AM0PR07MB6147.eurprd07.prod.outlook.com>
 <CADn-QaMEbXB9T9xMz3QQ0rFOKSGnR0mTgEtydAUrYoPJgULaSQ@mail.gmail.com>
To: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-SES-Outgoing: 2020.08.06-69.169.232.14
Feedback-ID: 1.ap-southeast-2.wp6P5VKgOE241tt9Uq95AupcmA4MgXmCsfiLYAGFntA=:AmazonSES
X-Mailman-Approved-At: Thu, 06 Aug 2020 15:53:39 +0200
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



> On 3 Aug 2020, at 19.14, Alexander Skwar =
<alexanders.mailinglists+nospam@gmail.com> wrote:
>=20
> Hello Erik,
>=20
> yes, I know that the DNS is private. This is why I have that on my =
macOS
> configuration:
>=20
> # =E2=80=A6
> AllowedIPs =3D 10.136.16.0/22, 169.254.169.253/32
> # =E2=80=A6
>=20

Did you set DNS servers manually in "Advanced" section? If yes, try to =
clear it.

I use macOS too and everything works fine.

Did the DNS server 10.136.16.2 is the same VM as WireGuard server? If =
it's in the same VM, maybe you can try the IP address of server peer =
instead of IP internal of VM.

I hope that give some hints.


Regards,

Shulhan=
