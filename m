Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9BEEF06E3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:50:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 779fa1db;
	Sun, 8 Feb 2026 17:17:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0db119d1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jun 2025 20:15:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GKBAFW014442;
 Mon, 16 Jun 2025 20:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=fULxdXRDsw7CQ6/kfd1H1x
 zgimrAJzQNxMbQWIYLgB0=; b=Yg3sXYnb+0HDmlnQvcDWv0ImBxZ1qJCouSHApu
 fChoQP2w5Gv8FMCy2MxVOm6lasrOWv6XAyAr6N5TKjtSgWGg1imGotVCyuLM747x
 dKUYPDg4hmEls3B0YqFABGLxfaQARExE9VMrkFQ9kj+zFMsnhF4B0izwENlbCgCb
 7v0OEYSatiFv0gJuJbWVx2sHydOfXMbxZzdQdVmxupG+aB9/Y90xTJC7R4dSYUNe
 WuyoUYimE+M+1eKhwxZz+je7Q4zcOmeDTZZDCyxrONUXTXZk9mFxqxUapqz5ZCtb
 c0t7UqaE5F8SPXzDsK6E7Y33T+DY1cTWf/jRZXgOLzNDEuxA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuw97cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 20:15:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GKF1Zu029092
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 20:15:01 GMT
Received: from [10.216.18.85] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 16 Jun
 2025 13:15:00 -0700
Message-ID: <2c5257a7-e330-4983-8447-3e217b616b2e@quicinc.com>
Date: Tue, 17 Jun 2025 01:44:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Jason A. Donenfeld\"" <Jason@zx2c4.com>, <wireguard@lists.zx2c4.com>,
 <netdev@vger.kernel.org>
From: Sharath Chandra Vurukala <quic_sharathv@quicinc.com>
Subject: Issue with rtnl_lock in wg_pm_notification
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6xKmBaaPUQSDyZ3lQAHv2veAx1zn_8kL
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=68507b58 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=AJ7OG-yrU3hLHepi_tcA:9 a=QEXdDO2ut3YA:10 a=Kfep4x4mMYYA:10
X-Proofpoint-GUID: 6xKmBaaPUQSDyZ3lQAHv2veAx1zn_8kL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE0MCBTYWx0ZWRfX8PaHLADbOBMu
 HMgrgle/2F0H+rcEntviKDEi+zBoktE5vJ5cQtEz/ds4crf5lJWt8KIKTIQZyJwm2HmzHM4vybj
 uV7svF6EMYtiZ+FsT2a2HGDmMFPtuHkP+vLYBtFDxy2lh1py9NNZr3Ql06jnSf9UT2PAYNAZIG7
 rMrjZSKo9lAqqS/xzcDl43UkZegv7Ji/YtPeoTwsvp7VZ997eFXhEytrxVRlxHz/v+Vf+hGVhMf
 mEZV0hjKoMBMvPEqm5VzBBj/NlzAlVmL8L8f3vRe/c+xoX29JgOoC4SPY6eSKj4eTuuUuStQjvP
 FFnMcHV+KwVHS/I9IbWLZ96XG3jdxvtTCGHoFD0kF9G52FEeyPJ0u72M/OoxLXy8w678YvYHo8B
 tuierlKos06OkB3SRLhDP6rjFilNdVFCEByjvpu17fjDaZLlhkDWFvQw+V7merprQxBgJ2lD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=809 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160140
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:17:13 +0000
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

Hi All,
I work on rmnet driver(more details at https://docs.kernel.org/networking/device_drivers/cellular/qualcomm/rmnet.html), This driver registers onto any physical network device in IP mode.
This driver registers/deregisters for PM notifications based on the NETDEV_REGISTER/NETDEV_UNREGISTER notifications received for the physical netdevice.

In one of the tests, involving a frequent system suspend/resume and physical netdevice registration/de-registration, a deadlock has been observed involving the rtnl_lock and the pm_chain_head->rwsem.
The sequence involves
Thread1: unregister_netdev(holds rtnl_lock)-> notification sent to rmnet driver( netdev_chain) -> rmnet driver attempts to unregister for pm_notification( involves acquiring pm_chain_head->rwsem).
Thread2: pm_suspend -> pm_notofier_call_chain(holds pm_chain_head->rwsem)-> wg_pm_notifcation(trying to acquire rtnl_lock)

I do not understand fully what wireguard functionality is, but considering that rtnl_lock is a global one, it does not seem to be a good design to have notification callback acquire this lock.
Can we check if rthl_lock be avoided here OR 
Use rtnl_trylock instead of using rtnl_lock and consider deferring the work to a context where it is safe to acquire the lock( may be a workqueue), something like below to avoid the deadlock?

static int wg_pm_notification(struct notifier_block *nb, unsigned long action, void *data)
{
          struct wg_device *wg;
          struct wg_peer *peer;

          /* If the machine is constantly suspending and resuming, as part of
           * its normal operation rather than as a somewhat rare event, then we
           * don't actually want to clear keys.
           */
          if (IS_ENABLED(CONFIG_PM_AUTOSLEEP) ||
              IS_ENABLED(CONFIG_PM_USERSPACE_AUTOSLEEP))
                          return 0;

          if (action != PM_HIBERNATION_PREPARE && action != PM_SUSPEND_PREPARE)
                          return 0;

          if (rtnl_trylock()) {
              list_for_each_entry(wg, &device_list, device_list) {
                              mutex_lock(&wg->device_update_lock);
                              list_for_each_entry(peer, &wg->peer_list, peer_list) {
                                              del_timer(&peer->timer_zero_key_material);
                                              wg_noise_handshake_clear(&peer->handshake);
                                              wg_noise_keypairs_clear(&peer->keypairs);
                              }
                              mutex_unlock(&wg->device_update_lock);
              }

          } else {

                /* schedule a workqueue to delete timers clear up the keypairs of the peers?  */

          }

          rtnl_unlock();
          rcu_barrier();
}

Thanks,
Sharath


