Return-Path: <SRS0=i4ZG=5W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7304CC2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 05:11:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01BE72074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 05:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01BE72074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alexy-rousseau.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2664421e;
	Mon, 6 Apr 2020 05:02:49 +0000 (UTC)
Received: from 4.mo177.mail-out.ovh.net (4.mo177.mail-out.ovh.net
 [46.105.37.72])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fe338263
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 05:02:47 +0000 (UTC)
Received: from player761.ha.ovh.net (unknown [10.108.54.209])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id CEF3012BFF8
 for <wireguard@lists.zx2c4.com>; Mon,  6 Apr 2020 07:03:11 +0200 (CEST)
Received: from alexy-rousseau.com (nld76-1-78-214-156-147.fbx.proxad.net
 [78.214.156.147]) (Authenticated sender: contact@alexy-rousseau.com)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id 117151123F013;
 Mon,  6 Apr 2020 05:03:09 +0000 (UTC)
From: Alexy-Rousseau <contact@alexy-rousseau.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Some difficulties to initiate a simple tunnel with Android
Message-Id: <A37EAA6A-CB8A-4CA0-844A-C5A54152BF98@alexy-rousseau.com>
Date: Mon, 6 Apr 2020 07:03:08 +0200
To: Jason@zx2c4.com,
 wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Ovh-Tracer-Id: 13262819431428243555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephfgtgfgguffkfffvofesthhqmhdthhdtjeenucfhrhhomheptehlvgighidqtfhouhhsshgvrghuuceotghonhhtrggtthesrghlvgighidqrhhouhhsshgvrghurdgtohhmqeenucfkpheptddrtddrtddrtddpjeekrddvudegrdduheeirddugeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeiuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtohhnthgrtghtsegrlhgvgiihqdhrohhushhsvggruhdrtghomhdprhgtphhtthhopeifihhrvghguhgrrhgusehlihhsthhsrdiigidvtgegrdgtohhm
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

Hello everyone,

I want to create a very simple app where the user can connect itself to =
the VPN without any configuration.
If I understand everything clearly I just have to use the tunnel module =
who implements the wireguard-go version.

I=E2=80=99m a little bit confused :

- I read the source code of the tunnel path and the ui module and it =
seems that there is some dependencies between ui and tunnel.

I have some questions :

- Is it possible to use very simply the tunnel module, without ui and =
initiate very simply a VPN connection?

- Do I have a good idea by using now the tunnel? Will the compatibility =
of the library be maintained with updates?

- If the main difference between the Android & iOS app is the =
implementation of the tunnel module, is it a good idea to create a =
flutter UI with two different ways to communicate with the library for =
each OS?

Thanks in advance for your help!

=E2=80=94
Kind regards, Alexy ROUSSEAU=
