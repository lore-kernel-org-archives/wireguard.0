Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3104C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 05:50:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C3822838
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 05:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1C3822838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10a1dd29;
	Tue, 5 Jan 2021 05:39:12 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08olkn2087.outbound.protection.outlook.com [40.92.45.87])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c2010e9a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 05:39:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMHmdUUQdMMdpTsYYHOzaBlOc26gGcj+wUBcipitTa1fxD5IfIxk6cRzb2+NexNjwW7CZ21Uw8BGuWDXM1s8xGV/qFA3GicF2XPMn7Ie9W7rBnboCV1hIUnztwAq5/38jdWpWMyskaUe+CToMVLdAJ4VOZ1oSfogGTE8uaV798GJmR5gPnId4iJKM2GVq0h7MlxgAPzvrembEtekerLCzRUbONUKA3GyQ+K1GGNpkItgSSwsi307oiztTQfAKeQvlWrLRReOHdq43dNXsK1Lc9DL3lzWGAt7rLpte4CfuWSofiR99SUIq5C5ghwSBcfdCNtO3JTw7W2lVYaN6arPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEU92MAKsV9JHE6aPYSHKARr7inNGHeJyyFps2qs5QI=;
 b=Cdu6Vkqz+V9DZGqDUqdO/7JYVBYK2ZfolAHgk+P0yysyKRI4v84cBJLqS5S8gBhUgURCykAJHx0b/tDTLQQrTg2lxrotbSblY7ierxXSvxWd9GOa7RHs+WAAAaZZp2y8+oLvUU+ne4UcsHC//0dQBNXRDHaaha56FpqpFOIT+ZHCOfJ/jxz+lIw3yySTOpO/W2jwwRC3J7KcsiO43395RhWpfuSPryqT+4IMHykMXfANzpnLG7dGWT52DcNG97Kcs3hL7PVSa8CmYPrFbbMWgWzzRNLeEsgd47coKv7U3swD8J+Cpx2JMzwExZGHLKRF2dql5BnqiQqEqE91ydNR6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEU92MAKsV9JHE6aPYSHKARr7inNGHeJyyFps2qs5QI=;
 b=iZ7n6e25bRvYZJ6ku5Yb0u1hcHg3VutWdlpdXwb/Z+SWnkUOrW4AHJ9arXdxTNaubT4IocWCHNcRFEdr9zzNFyyRikfpr9vzTh/s3GTt+6s3TRUEOj28WtNAuDPlFHa8zyreAFX6jhfS4Y+/reopJh14BQBaO7QcJfBLPYduHFIsn0uOiT8Yah+QWApHRWHPvozPrsNgkD7AJoteLeJvuF4z9S6HP2XP/U8S1b8ogO+dD9L1mxihN3yicjzTCkbDQMbv4sxAUhOzeA6szn+SRot1gxP2kFc1esJIX8dTnBpZqUxnYXPRGgWGJTh4UYxaQ6VpMTW24K7jF6CRYISIPA==
Received: from SN1NAM04FT008.eop-NAM04.prod.protection.outlook.com
 (10.152.88.51) by SN1NAM04HT093.eop-NAM04.prod.protection.outlook.com
 (10.152.89.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Tue, 5 Jan
 2021 05:50:05 +0000
Received: from DM5PR0701MB3670.namprd07.prod.outlook.com
 (2a01:111:e400:7e4c::42) by SN1NAM04FT008.mail.protection.outlook.com
 (2a01:111:e400:7e4c::143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23 via Frontend
 Transport; Tue, 5 Jan 2021 05:50:05 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:87FADF28B51D5750FB7972A23A93BBC54CC95AA49315E950BF684D1736062482;
 UpperCasedChecksum:8502273B507C3C59E9FF1CA50933A3343D087FB1C05E0DB4331C96F2FE173F66;
 SizeAsReceived:8768; Count:48
Received: from DM5PR0701MB3670.namprd07.prod.outlook.com
 ([fe80::57b:4d1b:f661:1e16]) by DM5PR0701MB3670.namprd07.prod.outlook.com
 ([fe80::57b:4d1b:f661:1e16%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 05:50:04 +0000
Subject: Re: [PATCH] wg-quick: Android: Use ip link to set MTU
To: Harsh Shandilya <me@msfjarvis.dev>, Jason <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
References: <DM5PR0701MB3670A1B8ADEF9BC7C8E06FEE92D30@DM5PR0701MB3670.namprd07.prod.outlook.com>
 <375e4f5117985cc3d71fbd786e5ab3f1@msfjarvis.dev>
From: Adam Irr <adam.irr@outlook.com>
Message-ID: <DM5PR0701MB3670F47423368F887D0D13A392D10@DM5PR0701MB3670.namprd07.prod.outlook.com>
Date: Mon, 4 Jan 2021 21:50:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <375e4f5117985cc3d71fbd786e5ab3f1@msfjarvis.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TMN: [Fd+RzN3xuMPnAMuBpqRZfLvYRWs3HpZo]
X-ClientProxiedBy: MWHPR18CA0058.namprd18.prod.outlook.com
 (2603:10b6:300:39::20) To DM5PR0701MB3670.namprd07.prod.outlook.com
 (2603:10b6:4:7e::18)
X-Microsoft-Original-Message-ID: <e952ad85-c301-d1af-167d-b8e8b278d967@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.4.30] (67.171.17.201) by
 MWHPR18CA0058.namprd18.prod.outlook.com (2603:10b6:300:39::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.19 via Frontend Transport; Tue, 5 Jan 2021 05:50:03 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6a41f2a0-2a75-47ca-4e1f-08d8b13dc02c
X-MS-TrafficTypeDiagnostic: SN1NAM04HT093:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5EfHqc6ZnjNP7QBXkaNwEbo7Pl291yFwc4eENFLKI64055E0AHSgwCvmSkI3/qmoPfT6tLil5wZsG6tLKj8i81CdyS3Vo+gEdZMKpNEvE1vOntHp/fxWsnWyxP8QOXCs5EeBk5VptRQI+4wPVGhwx7WdeddT02TWsWLJHHiP4DgibFxUmy9HFUc4dOQSxgIpLMlyU5f7qYCYNpCOt8oJmwQAteB0NtIR7v7Wv5IKvZ4a0oSrM78ZakexnRR/KAMEvPzuf00bhwgswKLnBCXezXdkurjgtcVAx9xGfXmnruk=
X-MS-Exchange-AntiSpam-MessageData: M/yStoshuwd9/EBONW7cBW6IVNl0YmNcaBCuCDpZK7gxlE9C0is/M5R9+QHhL20gLiBLTmhy5hCvxdQ+5ZMNekMe71J7baevyqRNCTArn9EKAvcnOEseoYCx3/97qN/PY/CLS7HXb2PK7+z8Bow97A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 05:50:04.7615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a41f2a0-2a75-47ca-4e1f-08d8b13dc02c
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM04FT008.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM04HT093
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

Hello Harsh,


On 1/4/21 9:53 AM, Harsh Shandilya wrote:
> Hey Adam,
>
> On 2021-01-03 05:59, Adam Irr wrote:
>> The ndc command used didn't work on my Nvidia Shield (rooted with a
>> custom-built kernel). The ip link command does work. I have only
>> tested this on an Nvidia Shield (Android TV - Version 9.0 Pie).
>>
>> I couldn't find a lot of documentation on ndc so it's possible my
>> device/kernel is misconfigured. If you suspect this is the case, let
>> me know.
>
> You couldn't find documentation because there isn't any, it's 
> effectively "private API" and Google has broken it time and again. It 
> is rather curious that you're running into this issue though, since 
> we've had the NDC code in place since before Android 9 came out and 
> went through breaking changes in every cycle without these specific 
> invocations failing. The last ndc related problem we had was with the 
> Android 11 release, where a similar fix[1] was implemented.
>
> I've Cc'ed Jason for reviewing this change, but I'm decidedly curious 
> as to why just the Nvidia SHIELD seems to need it.
>
I get a permission denied error when running the ndc command, even with 
root. Given the lack of ndc documentation I didn't get any further than 
that. If you have any other ideas I can try them.

darcy:/ # ndc interface setmtu wg0 1418
400 0 Failed to set MTU (Permission denied)
darcy:/ # ifconfig wg0 | grep MTU
           UP POINTOPOINT RUNNING NOARP  MTU:1420  Metric:1
darcy:/ # ip link set dev wg0 mtu 1419
darcy:/ # ifconfig wg0 | grep MTU
           UP POINTOPOINT RUNNING NOARP  MTU:1419  Metric:1
darcy:/ # whoami
root


I'll await Jason's review


>>
>> Signed-off-by: Adam Irr <adam.irr@outlook.com>
>> ---
>>  src/wg-quick/android.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/src/wg-quick/android.c b/src/wg-quick/android.c
>> index 326efa9..941c7b8 100644
>> --- a/src/wg-quick/android.c
>> +++ b/src/wg-quick/android.c
>> @@ -995,7 +995,7 @@ static void set_mtu(const char *iface, unsigned 
>> int mtu)
>>         int endpoint_mtu, next_mtu;
>>
>>         if (mtu) {
>> -               cndc("interface setmtu %s %u", iface, mtu);
>> +               cmd("ip link set dev %s mtu %d", iface, mtu);
>>                 return;
>>         }
>>
>> @@ -1016,7 +1016,7 @@ static void set_mtu(const char *iface, unsigned 
>> int mtu)
>>                         endpoint_mtu = next_mtu;
>>         }
>>
>> -       cndc("interface setmtu %s %d", iface, endpoint_mtu - 80);
>> +       cmd("ip link set dev %s mtu %d", iface, endpoint_mtu - 80);
>>  }
>>
>>  static void add_route(const char *iface, unsigned int netid, const 
>> char *route)
>> -- 
>> 2.25.1
>
> Cheers,
> Harsh
>
> 1: 
> https://git.zx2c4.com/wireguard-tools/commit/?id=9a0d65e2afbd6e418c883e0de8555b4fac29f1d5


Thank you,

Adam

