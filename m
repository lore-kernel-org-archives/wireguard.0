Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2E6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jun 2022 12:41:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c3bfc035;
	Wed, 1 Jun 2022 12:41:11 +0000 (UTC)
Received: from bullseyemail.carmickle.com (bullseyemail.carmickle.com
 [2600:3c03:e000:644:f03c:91ff:feee:b908])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 742a6000
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jun 2022 12:41:08 +0000 (UTC)
Received: from [IPv6:2600:3c03:e000:3c2::91:66] (unknown
 [IPv6:2600:3c03:e000:3c2::91:66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bullseyemail.carmickle.com (Postfix) with ESMTPSA id 71B75402927A;
 Wed,  1 Jun 2022 12:41:07 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: How to improve Wireguard speed?
From: Frank Carmickle <frank@carmickle.com>
In-Reply-To: <CABBZOsmMSnspA6iTCvv0QZLL9KVtGSvt+KPAMqWecOmKubou4Q@mail.gmail.com>
Date: Wed, 1 Jun 2022 08:41:05 -0400
Cc: Roman Mamedov <rm@romanrm.net>, Janne Johansson <icepic.dz@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E410057D-B5FE-466B-9B0D-E9ADA7B48298@carmickle.com>
References: <CABBZOs=CRGXaYmajx6GLJMU0sxZbda=qDgKsiB_KM_k3DygCJg@mail.gmail.com>
 <CAA6-MF84eCwegH3UcQuqrL7YaCQULf5=KafQYZPVJWATEtfL0Q@mail.gmail.com>
 <CABBZOs=kxe4DwHN=utdb8FzDTt3=TcSo05JVAo=-JCUjC_eEug@mail.gmail.com>
 <20220601145143.75234bd8@nvm>
 <CABBZOsmMSnspA6iTCvv0QZLL9KVtGSvt+KPAMqWecOmKubou4Q@mail.gmail.com>
To: Houman <houmie@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
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

It's almost certainly the iPhone that's the slow part. The wireguard =
implementation on iOS is running in userspace.

--FC

> On Jun 1, 2022, at 7:40 AM, Houman <houmie@gmail.com> wrote:
>=20
> Thanks Roman.
>=20
>> So did you apply both of that, and what was the effect?
>=20
> I will create a new environment this afternoon and test the MTU
> changes mentioned earlier and investigate the outcome.
>=20
>> What are the other point that you test against, is it another VPS =
(better if
>> you could try with that), or your home connection?
>=20
> The iPhone is connected via Wifi to the home network, which is 500 =
Mbps / fibre.
> I have a code snippet on the iPhone that downloads a 1 GB test file
> from my AWS bucket (London) for 10 seconds. Then measures
> totalBytesWritten / time elapsed / (1024.0 * 1024.0) * 8.0.
> Which is the formula for Mbps as far as I am aware.
>=20
> Client (iPhone) --> server (VPS) --> S3 (AWS) =3D 117 Mbps
> Client (iPhone) --> S3 (AWS) =3D 506 Mbps
>=20
> I run this once the Wireguard connection is established and I get 117
> Mbps. Then I disconnect the VPN and run the same code again to fetch
> the test file without VPN that comes down to 506 Mbps. Client
> (iPhone), server (VPS) and S3 (AWS) are all in located London, UK.
>=20
> I have run your iperf test.  On the VPS the Lost/Total Datagrams is
> 0%. On the client (Mac) the Lost/Total Datagrams is 0.13%.  This test
> proves that the ISP isn't messing around with UDP.
>=20
> [  5] local 192.168.1.101 port 62103 connected to xxxxx port 5201
> [ ID] Interval           Transfer     Bitrate         Jitter
> Lost/Total Datagrams
> [  5]   0.00-1.00   sec  59.5 MBytes   499 Mbits/sec  0.034 ms  =
0/44538 (0%)
> [  5]   1.00-2.00   sec  59.7 MBytes   500 Mbits/sec  0.012 ms  =
0/44677 (0%)
> [  5]   2.00-3.00   sec  59.3 MBytes   497 Mbits/sec  0.021 ms
> 15/44400 (0.034%)
> [  5]   3.00-4.00   sec  60.0 MBytes   503 Mbits/sec  0.015 ms  =
0/44913 (0%)
> [  5]   4.00-5.00   sec  59.5 MBytes   499 Mbits/sec  0.020 ms  =
0/44588 (0%)
> [  5]   5.00-6.00   sec  59.3 MBytes   498 Mbits/sec  0.018 ms
> 219/44662 (0.49%)
> [  5]   6.00-7.00   sec  59.6 MBytes   500 Mbits/sec  0.065 ms  =
0/44633 (0%)
> [  5]   7.00-8.00   sec  59.6 MBytes   500 Mbits/sec  0.037 ms  =
0/44614 (0%)
> [  5]   8.00-9.00   sec  59.6 MBytes   500 Mbits/sec  0.024 ms  =
0/44633 (0%)
> [  5]   9.00-10.00  sec  59.2 MBytes   497 Mbits/sec  0.024 ms
> 339/44686 (0.76%)
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Jitter
> Lost/Total Datagrams
> [  5]   0.00-10.01  sec   596 MBytes   500 Mbits/sec  0.000 ms
> 0/446756 (0%)  sender
> [SUM]  0.0-10.0 sec  657 datagrams received out-of-order
> [  5]   0.00-10.00  sec   595 MBytes   499 Mbits/sec  0.024 ms
> 573/446344 (0.13%)  receiver
>=20
>=20
> For now I'm out of ideas. I will try to play around with MTUs this
> afternoon and see what happens.
> Thanks,
>=20
>=20
>=20
>=20
>=20
>> It could be your home provider has different speed limits (shaping) =
in place
>> for UDP. Should be possible to test this with:
>>=20
>>  iperf3 -s                        # on VPS
>>=20
>>  iperf3 -u -b 500M -c <VPS IP> -R # on the other side
>>=20
>> And then see how many "Lost/Total Datagrams" (xx %) you get. A high =
percentage
>> would indicate that the actual top speed for UDP is less than 500Mbit =
by this
>> value.
>>=20
>> --
>> With respect,
>> Roman

