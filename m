Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B7DC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 19:40:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B1A61073
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 19:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22B1A61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=northwestern.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59f8aa49;
	Thu, 14 Oct 2021 19:40:48 +0000 (UTC)
Received: from chcspprf10.ads.northwestern.edu
 (chcspprf10.ads.northwestern.edu [165.124.29.100])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42f28121
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 19:40:46 +0000 (UTC)
Received: from pps.filterd (chcspprf10.ads.northwestern.edu [127.0.0.1])
 by chcspprf10.ads.northwestern.edu (8.16.0.43/8.16.0.43) with SMTP id
 19EJVqEp018477; Thu, 14 Oct 2021 14:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northwestern.edu;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=Ny7YHcT0gmcu36xh6j6VADw1iEnt+px+z713U07PCQQ=;
 b=TR5u1KWKKhd0ELSiTb46fPGpaX7Sj64/gJp6lQsImbqwRZ8OkGcIpdyz/9ODxt2R/pPf
 rbHA1aLSCKlEMLG0YTDOBQpZDewfk3yx5Tmq0aaTtoG3l7nY06M/aSDVNJ1e/OYRiZl2
 f4LyeaRHciS03MqhmmuTFcWeqxl3baoq0M9jq51j0SjdtQKHiyXh8x3EZeFKMi1cNqHf
 rwU8ZT1IvlEnXBxiMEdMm2asXwSn7NUrGqA7+14YBAJ9IYW6veDElLe6PgLV0/Lv0qcv
 1QIOY+t/4qds8zTYzdVS5AItpZd3ll4WiacanhWwxL9RvxG0xtfE7vdgGP3eEiwYvtFm ZQ== 
Received: from chcspexch01.ads.northwestern.edu
 (chcspexch01.ads.northwestern.edu [165.124.43.220])
 by chcspprf10.ads.northwestern.edu with ESMTP id 3bnwh8y46e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 14:40:44 -0500
Received: from CHCSPCAS03.ads.northwestern.edu (165.124.43.209) by
 CHCSPEXCH01.ads.northwestern.edu (165.124.43.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.922.13; Thu, 14 Oct 2021 14:40:44 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by CHCSPCAS03.ads.northwestern.edu (165.124.43.209) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23 via Frontend Transport; Thu, 14 Oct 2021
 14:40:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gt+4pdLV4D+xe0ExoXB3Ndzc07OKEV9qJuE4fTmWcTge2qTCIzpuRB7lsIUEzs99rcoCBHQMomaiT4qHVx73KGIKo0Q1Qmq4muX+UCH/I42Uof3+a5phOR5qsLpC35gkAUSD5JkOQHvYrXo96ZcC82zM0trjpXpuuckF2D6uRxaMZaKpXNd947amshmeFpexOPyOJ9RR66IRpVVbXlaUizhQLYiDY6lyDBTLGfJZ/qF5Phs+3PdRWjq19AT4p51AFnfmv11ypWhpBs1dcsXIgpTiim+0LG9RgJBsGwDx8lnV+kztYT5YKtaeCTRVSepoxIpm6E+AZlnzcsXYC573iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ny7YHcT0gmcu36xh6j6VADw1iEnt+px+z713U07PCQQ=;
 b=bZr9adShdbfQdwRkgY+mwvMrNWpLCv0TKc9MKO8ycwWW08unmSFcvBVHizq1LTGoJ9zt8Xtcvhx10giKKWN53Q2p4ZACBMoxDK1jO/GSAE4GJ+XkziPmSy1B7OJJtrElx+Az9b8CDn4tjGsauDBZvhC3xMvPrm9Jo7vPk3EwyML8l7Ew5hTqhzl70YZWAYh7z1KyIvm1R6hJnE2fODizVVw2JeSFjS7kZN+RkqrS9+gcDwZLhP5xm8+5TOo0LFHJJ8/gngqFoa+YxJhiT9h/YMa+n1cQO6tgOtUU/LXOxfTLlU6AaSSkUZd7H6QRdaE3m5AgjrhRXjUtCCnTAt23Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northwestern.edu; dmarc=pass action=none
 header.from=northwestern.edu; dkim=pass header.d=northwestern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuwildcat.onmicrosoft.com; s=selector2-nuwildcat-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ny7YHcT0gmcu36xh6j6VADw1iEnt+px+z713U07PCQQ=;
 b=op9WlYAMKJJU/FHx+GffYvDnCD148SoYS3qwtu9Ryj0BDG/gc/nvsFC/r/TJNeLQqOTX8Pqcg+ghzXQvGqZ9P/H5dciYtv6tB/PPUfSDlYOt6KiIy/hZjz0TCKWndXa9JFWxzR5bDXvGduAdy4PeQ0sR4wKqEliGY4k1n8JyWis=
Received: from PH0PR05MB7962.namprd05.prod.outlook.com (2603:10b6:510:79::6)
 by PH0PR05MB8589.namprd05.prod.outlook.com (2603:10b6:510:a7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10; Thu, 14 Oct
 2021 19:40:41 +0000
Received: from PH0PR05MB7962.namprd05.prod.outlook.com
 ([fe80::e0bf:a9c5:97e3:bd3e]) by PH0PR05MB7962.namprd05.prod.outlook.com
 ([fe80::e0bf:a9c5:97e3:bd3e%7]) with mapi id 15.20.4608.008; Thu, 14 Oct 2021
 19:40:41 +0000
From: Frank Wayne <frank.wayne@northwestern.edu>
To: StarBrilliant <coder@poorlab.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: Windows Log Output to Event Viewer or Text File
Thread-Topic: Windows Log Output to Event Viewer or Text File
Thread-Index: Ade8hXp6vXTKnBzbSjyqsCyYnavaygACoVmAAMgWpPAAAF8sgAAgcX6QAAq46YAAMLVwMAACY9gAAAGMY+A=
Date: Thu, 14 Oct 2021 19:40:41 +0000
Message-ID: <PH0PR05MB7962D9FE88186BD52AE9774699B89@PH0PR05MB7962.namprd05.prod.outlook.com>
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
 <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9q3j=2HG-4v5tpHRM9DCKpw+5iSMyzu30jAUHS1r=eDHw@mail.gmail.com>
 <PH0PR05MB79629688EB84BF07A2AEF54F99B89@PH0PR05MB7962.namprd05.prod.outlook.com>
 <b1b2fc28-fee0-4801-ac42-fcd8d985e837@www.fastmail.com>
In-Reply-To: <b1b2fc28-fee0-4801-ac42-fcd8d985e837@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: poorlab.com; dkim=none (message not signed)
 header.d=none;poorlab.com; dmarc=none action=none
 header.from=northwestern.edu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78a7f550-66c4-4926-7cfd-08d98f4a81dd
x-ms-traffictypediagnostic: PH0PR05MB8589:
x-microsoft-antispam-prvs: <PH0PR05MB8589BDAFD8171E3F72687B9999B89@PH0PR05MB8589.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jQMMsKIb87UYdB0qf0j3zCvTzP4efq0GyUfVkMU8Mxf7N1q2gpqvszJ/L9eNC5U4FlaUWu/PhgoAucL386V17W3ngpHcmej0mrYj0FiqXdN4XRKn832QZlLAPYobuGgECsZ430CLnSccsyjvXfMZ+c/2Ppx8d3BfhuIT0AqmHt6c62XLqXAuLdRuVIz6NqCgmHiLyDtqatREerdqpTOh+0xZH/K9LDCen18gO4U6eQG9P+beHJcO4m16c79hOE4YZQF8iNXXLkxBP/daRZMRXsoof3wERwsaoxPYxs9HetSfwDazXU6gAbw22Nslu6C2IPlCACqF9SulEQdxhY4W+C8dwaqioqraDLEXVL6euOpoz/y9nGEV7CAsbSTRDloFV3g8moRFKAf6V74PpVbc4VTszKT2hSjRdFSv6qSWL9yTV57hjLiVH+Gbkp454AG+/MDTpnNQLMWeBCVxlvqIBl/3ll3dNeyCS1P7SVhxVMI+wep5XSJi+j7Pj581PXSovobEXzC0HUetmbuecJq/olndGAPNvXE7ucuDwQSdZXSXCYQ4lY+FLbcnjRYHl5VQIOPoTgknGD766xNVywHXK2ROloY7OeiZdQBfMs2OTsvg+gbIpWsfbfRsn+7YM05GOqv4olug5Pr0wG1irhkYTD1RhfclBrJ85pqpcozJmdCWNfoEMfMX9pqPQajQZOZYvmtvxFhosgy8tdnyiYMQa+kIzKQO0JZ0OLBPz7s9/zkVhoJOB+bdHzPyUySXyDubWwWNXRpDSka9k5WNDgl1LUFjd7paQ+30iDC/fEtrwDc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR05MB7962.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(316002)(9686003)(6506007)(53546011)(26005)(52536014)(786003)(5660300002)(71200400001)(7696005)(75432002)(38100700002)(8676002)(66556008)(44832011)(76116006)(66476007)(83380400001)(122000001)(66946007)(2906002)(110136005)(86362001)(33656002)(966005)(38070700005)(66446008)(186003)(508600001)(8936002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YliWNvrsM09C3+VzuP6D4QfnVmq7q4yxzgA/ryyhi5gAuRWDii4TE4/rOQSY?=
 =?us-ascii?Q?dwmaArI3CbGh/+/gZQXkKnPdY0uAS21L/VuQlTxwqGqGe9aEBnxS4Zd3iBcA?=
 =?us-ascii?Q?WwI4E/cWtrig+oH+FpcHn4qvaL47xhhjk9E1yuTzwWB0/lAadGZFDkH5p6eP?=
 =?us-ascii?Q?TceFrmzbcgbmIaShcM+YAE+uyWyvqYjQirq0M/wBkc5HchxA2Kdf/r7RsY6U?=
 =?us-ascii?Q?E3yyB3KPOh8SNcFdKaKbouconDouOKOvYJbv3/hw5GWeUBxuplbd71JMVZt6?=
 =?us-ascii?Q?v+vaesg6IPIkr1iNmndYA8FeUHNSgzQUzqfiWgfIjZVisf9tR1BNb+J8YMpp?=
 =?us-ascii?Q?fTQOwcOMtKSOjcHzOgM6AIOLmVmWIkENJfIfmRfZ0LUYWgXnlPKCGfNHrEM1?=
 =?us-ascii?Q?X1wB0TkxSQv6H9V9MgksQ4x9BMnk1s4ra595p73awvodnud5Isgh178D8FLG?=
 =?us-ascii?Q?BNnLHpagf3Y/A2TGwtv2MO8IYe1jCLEyBNT22cQbLK9JvsLiDEm6PoifnVGk?=
 =?us-ascii?Q?rQ1LdeFXlltNW5TiMOi1sZAjW369Bk6nMRvesHFKrzbXXLopB5Xic3T2u/dq?=
 =?us-ascii?Q?FugB5gxzow9zw4Sjvw4TSsnZyWH+SH5MQvYajd9kJTN2oF4/DOy4huV26kxP?=
 =?us-ascii?Q?r6kcZGboj8pwM3pW7IBBDeperYqyGXfV3Pa5woPJAoABh3dtbxd8Y/okBpf7?=
 =?us-ascii?Q?eRTp4Xh2Gy2knatf2S5oq+g/nXnbtWwPJkxHN0u895ujDSxwfV2GNffm2+QI?=
 =?us-ascii?Q?qwnae4dkwgJOtYeju8yLZA8R2qFKf7ii4hawioocqvcpfbmso8RbwdNRbeJD?=
 =?us-ascii?Q?uu/1aPmkIFAbmTzzrnxu5fVCMwI4m6nkaX6HuzT73NMeDPhPqFZ8H8sOZ1G5?=
 =?us-ascii?Q?lg7n/nfD4znUptUu0b1IddlDL/orfrurNSGfVy2XGuYMruItefqOYPY/O74m?=
 =?us-ascii?Q?lyOMY/0aGUsIRmB74MWwIfdAZkF44GIf3QlZE5iKxy1Cm6FJ3E32Hg/q9fGD?=
 =?us-ascii?Q?HHmPmBI9N6qdTvvHd6fIIFTAw6lmj+u9+MiOuYG3uLmgjUbp82k+3usVrbMc?=
 =?us-ascii?Q?K6+bGHnLcFjjlVHH8MkyPpfQQ2t/xm38hdO/uLaSZKwhSLlXz57fmo4XvF+f?=
 =?us-ascii?Q?O7glqLDn+ffoJ5aa5SP1C89cTWQwz7aax7T4s43YS9saO1ef+UNsugQnZGQR?=
 =?us-ascii?Q?toE4GeDO80RSupUhNej6J+MlBnKEOv2qP6rn7xJOkII9rcTyonDoo3FLReR3?=
 =?us-ascii?Q?7GjAUZlRXVCKls/00gZjo42HWk8zlqiHxBuKcfOhCt8bnBQUUcSTmj30XZb8?=
 =?us-ascii?Q?eBgU3worsZQXZI5ADVd9gW4zIYomQpGyWrrIIW7d5+LCdssHg06Kqiprl83C?=
 =?us-ascii?Q?pC9MakG6YOe18jC+2QvShvwtSU3I9ltzjh9KjvrdrBWeA6zpSnl+yvb7zZ4C?=
 =?us-ascii?Q?lIkhKx7nWjU7w3VJKGwaCymKYgcyFW0JHdDXaKhftbSWnkXcb8Y9791Ijw3o?=
 =?us-ascii?Q?pY4hqdBFScEM9rhb/f+oA9E8/wIL1Q3mKn9Dl+cc4KoYdPXh5PJfa8xzISOg?=
 =?us-ascii?Q?L6FC6IJI15QaNjJZ1K/oCd3UiHUbgTeR5yHEvUhXV7lswa6DtQqgJE8cqJuc?=
 =?us-ascii?Q?33SICzR/QT0iJw9e2y88914osSc7fYnEe34dIORdazRYnZCEtn5mwaLp+ndA?=
 =?us-ascii?Q?gch9AQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR05MB7962.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a7f550-66c4-4926-7cfd-08d98f4a81dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 19:40:41.7250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d76d361-8277-4708-a477-64e8366cd1bc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: liLiDBcj1lhBbHsxF6vv7D8FJWrye14eRtAVqyLH0PCo+WLvItXBs3UDX1pSbq+CEUMy9XK5dP0+Bk9B5sNyOKTEk4E/jiVM3pVjoux2Rg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8589
X-OriginatorOrg: northwestern.edu
X-Proofpoint-ORIG-GUID: O0RGytcs__BIhCcgyk5iwsj6_aQ6pVMk
X-Proofpoint-GUID: O0RGytcs__BIhCcgyk5iwsj6_aQ6pVMk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-10-14_07:2021-10-14,
 2021-10-14 signatures=0
X-Proofpoint-Spam-Reason: safe
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

> I am not sure if I get Jason's idea: Is current Wireguard driver using a =
ring buffer of 2,048 messages for logging?

Yes. There is a file (relative to the installation directory) at Data\log.b=
in. It contains a WORD with "0BADBABE" (base 16, converted to big endian; a=
 signature?), another WORD with something, followed by (in my case) 2050 st=
ructures of [a QWORD epoch time (with nanosecond precision) followed by 512=
 bytes of event text (zero padded)]. When I export the file in the WireGuar=
d UI, it produces a list of 2048 events.

> I am not sure if it has a notify mechanism: Otherwise, the userspace coll=
ector will have to poll the logs. Polling too fast consumes power, polling =
too slow may skip messages.

Hear, hear! Alas, it does not have a notify mechanism.

Frank Wayne

-----Original Message-----
From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of StarBrilli=
ant
Sent: Thursday, 14 October, 2021 13:40
To: wireguard@lists.zx2c4.com
Subject: Re: Windows Log Output to Event Viewer or Text File

On Thu, Oct 14, 2021, at 17:41, Frank Wayne wrote:
> On Wed, Oct 13, 2021, at 18:16, Jason A. Donenfeld wrote:
> > Event Logging appears to be rather slow and clunky [...]

In fact, Windows Event Logging has two APIs: ETW and WPP.
The ETW API is, indeed, slow and clunky.
However, the WPP API is very high-performance. The trace function in Window=
s native TCP stack is implemented with WPP.=20

If someone like Frank has the time and ability, they could check this MSDN =
documentation and try to implement it:
https://urldefense.com/v3/__https://docs.microsoft.com/en-us/windows-hardwa=
re/drivers/devtest/wpp-software-tracing__;!!Dq0X2DkFhyF93HkjWTBQKhk!CMEOhPS=
NaRk9va55Sq3P6hrPlsaEZR9cKugdVaKMMSFkQVvmvAwTk-w9efcePl7WnfDRnWcQ$=20
However, I also think this feature is *not* a prioritized task, at least fo=
r average users.

I am not sure if I get Jason's idea: Is current Wireguard driver using a ri=
ng buffer of 2,048 messages for logging?
I am not sure if it has a notify mechanism: Otherwise, the userspace collec=
tor will have to poll the logs. Polling too fast consumes power, polling to=
o slow may skip messages.


Best wishes,
StarBrilliant
